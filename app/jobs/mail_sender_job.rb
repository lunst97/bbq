class MailSenderJob < ApplicationJob
  queue_as :default

  def perform(event, model)
    all_emails = (event.subscriptions.map(&:user_email) + [event.user.email] - [model.user&.email]).uniq

    case model
    when Comment
      all_emails.each do |email|
        EventMailer.comment(event, model, email).deliver_later
      end
    when Photo
      all_emails.each do |email|
        EventMailer.photo(event, model, email).deliver_later
      end
    else
      EventMailer.subscription(event, model).deliver_later
    end
  end
end
