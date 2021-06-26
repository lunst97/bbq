class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_event, only: [:edit, :update, :destroy, :show]

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
  # GET /events
  def index
    @events = policy_scope(Event)
  end

  # GET /events/1
  def show
    if params[:pincode].present? && @event.pincode_valid?(params[:pincode])
      cookies.permanent["events_#{@event.id}_pincode"] = params[:pincode]
    end

    authorize @event

    @new_comment = @event.comments.build(params[:comment])
    @new_subscription = @event.subscriptions.build(params[:subscription])
    # Болванка модели для формы добавления фотографии
    @new_photo = @event.photos.build(params[:photo])
  rescue Pundit::NotAuthorizedError
    flash.now[:alert] = t(pundit.error_pincode) if params[:pincode].present?
    render 'password_form'
  end

  # GET /events/new
  def new
    @event = current_user.events.build

    authorize @event
  end

  # GET /events/1/edit
  def edit
    authorize @event
  end

  # POST /events
  def create
    @event = current_user.events.build(event_params)
    authorize @event

    if @event.save
      redirect_to @event, notice: I18n.t('controllers.events.created')
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    authorize @event

    if @event.update(event_params)
      redirect_to @event, notice: I18n.t('controllers.events.updated')
    else
      render :edit
    end
  end

  # DELETE /events/1
  def destroy
    authorize @event

    @event.destroy
    redirect_to events_url, notice: I18n.t('controllers.events.destroyed')
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:title, :address, :datetime, :description, :pincode)
  end
end
