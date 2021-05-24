class EventMailer < ApplicationMailer

  def subscription(event, subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = event

    mail to: event.user.email, subject: "#{t('event_mailer.mailer.new_sub')} #{event.title}"
  end

  def comment(event, comment, email)
    @comment = comment
    @event = event

    mail to: email, subject: "#{t('event_mailer.mailer.new_comment')} #{event.title}"
  end

  def photo(event, email, photo)
    @event = event
    @photo = photo

    mail to: email, subject: "#{t('event_mailer.mailer.new_photo')} #{event.title}"
  end
end
