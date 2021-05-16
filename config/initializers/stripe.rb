Stripe.api_key = if Rails.env.production?
                    Rails.application.credentials.stripe[:production_secret_key]
                else
                    Rails.application.credentials.stripe[:test_secret_key]
                end
