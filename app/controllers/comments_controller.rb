class CommentsController < ApplicationController
  before_action :set_event, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]

  after_action :verify_authorized, except: %w[create destroy]
  # POST /comments
  def create
    @new_comment = @event.comments.build(comment_params)
    @new_comment.user = current_user

    authorize @new_comment
    if @new_comment.save
      MailSenderJob.perform_later(@event, @new_comment)
      redirect_to @event, notice: I18n.t('controllers.comments.created')
    else
      render 'events/show', alert: I18n.t('controllers.comments.error')
    end
  end

  # PATCH/PUT /comments/1
  def update
  end

  # DELETE /comments/1
  def destroy
    authorize @comment

    message = { notice: I18n.t('controllers.comments.destroyed') }

    if current_user_can_edit?(@comment)
      @comment.destroy!
    else
      message = { alert: I18n.t('controllers.comments.error') }
    end

    redirect_to @event, message
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_comment
    @comment = @event.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_name)
  end

  def notify_subscribers(event, comment)
    all_emails = (event.subscriptions.pluck(:user_email) + [event.user.email] - [comment.user&.email]).uniq
    all_emails.each do |email|
      EventMailer.comment(event, comment, email).deliver_now
    end
  end
end
