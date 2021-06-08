if Rails.env.development?
  host = "localhost:3000"
elsif ENV["HEROKU_ENV"] == "staging"
  host = "gyakuten-app-staging.herokuapp.com"
elsif Rails.env.production?
  host = "www.yanbaru-code.com"
end

ActionMailer::Base.default_url_options = { host: host }

if Rails.env.production?
  # メール配信に失敗した場合にエラーを発生
  ActionMailer::Base.raise_delivery_errors = true
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    port: 587,
    address: "smtp.gmail.com",
    user_name: Rails.application.credentials.gmail[:address],
    password: Rails.application.credentials.gmail[:password],
    domain: host,
    authentication: "plain"
  }
else
  ActionMailer::Base.delivery_method = :letter_opener_web
end
