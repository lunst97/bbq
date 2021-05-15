class EventMailer < ApplicationMailer

  def subscription(event, subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = event

    mail to: event.user.email, subject: "Новая подписка на #{event.title}"
  end

  def comment(event, comment, email)
    @comment = comment
    @event = event

    mail to: email, subject: "Новый коментарий @#{event.title}"
  end

  def photo(event, email, photo)
    @event = event
    @photo = photo

    mail to: email, subject: "Новое фото в @#{event.title}"
  end
end
