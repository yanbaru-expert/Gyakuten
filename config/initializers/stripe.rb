if Rails.env.production?
  Stripe.api_key = Rails.application.credentials.stripe[:production_secret_key]
else
  Stripe.api_key = Rails.application.credentials.stripe[:test_secret_key]
end
