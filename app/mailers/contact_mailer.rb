class ContactMailer < ApplicationMailer
  ADMIN_EMAIL = Rails.application.credentials.owner[:email],
  SAMPLE_EMAIL = "test@sample.com"

  def user_email(contact)
    @contact = contact
    @name = contact[:name].presence || contact[:email]
    subject = "「やんばるエキスパートwebデザイン講座」お問い合わせ受付"

    mail(to: contact[:email], subject: subject)
  end

  def admin_email(contact)
    @contact = contact
    @name = contact[:name].presence || contact[:email]
    subject = "「やんばるエキスパートwebデザイン講座」お問い合わせ受付"
    receiver = ADMIN_EMAIL
    if Rails.env.development?
      receiver = SAMPLE_EMAIL
    end
    mail(to: receiver, subject: subject)
  end
end
