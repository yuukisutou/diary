class EventMailer < ApplicationMailer
  def creation_email(event)
    @event = event
    mail(
      subject: '記事作成完了メール',
      to: 'user@example.com',
      from: 'positivediary@example.com'
    )
  end
end