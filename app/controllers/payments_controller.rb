class PaymentsController < ApplicationController
  STRIPE_PRODUCTION_PUBLIC_KEY = 'pk_live_TarpapV3tug0Vx2CphYOFECA00Ni3DM9JR'
  STRIPE_DEVELOPMENT_PUBLIC_KEY = 'pk_test_eFU0CAPPnz6iVNzrKG0ER7mj00zOslinDX'

  STRIPE_PRODUCTION_PRICE = 'price_1IdnvGGiRzWonoYFW4sxYrTM'
  STRIPE_DEVELOPMENT_PRICE = 'price_1IfyqxGiRzWonoYFhM82Ds6t'


  def new_payment

    if Rails.env.production?
      price = "price_1IdnvGGiRzWonoYFW4sxYrTM"
    else
      price = "price_1IfyqxGiRzWonoYFhM82Ds6t"
    end

    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price: price,
        quantity: 1,
      }],
      mode: 'payment',
      success_url: request.base_url + '/payments/create_payment?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: request.base_url + '/payments/payment1',
    })
    # 下記部分リファクタリング
    if Rails.env.production?
      @pk_key = STRIPE_PRODUCTION_PUBLIC_KEY
    else
      puts "開発環境確認"
      @pk_key = STRIPE_DEVELOPMENT_PUBLIC_KEY
    end
  end

  def create_payment
  end
end
