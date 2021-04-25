class ContactMailer < ApplicationMailer
  ADMIN_EMAIL = Rails.application.credentials.dig(:gmail, :design_owner)
  SAMPLE_EMAIL = Settings.email.sample

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
    receiver = Rails.env.development? ? SAMPLE_EMAIL : ADMIN_EMAIL
    mail(to: receiver, subject: subject)
  end
end
