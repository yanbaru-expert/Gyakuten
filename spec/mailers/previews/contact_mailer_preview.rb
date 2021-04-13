# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/user_email
  def user_email
    ContactMailer.user_email
  end

  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/admin_email
  def admin_email
    ContactMailer.admin_email
  end

end
