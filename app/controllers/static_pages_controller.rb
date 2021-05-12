class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    @faqs = Faq.where(genre: %w[always top]).order(position: :asc)
  end

  def design
    @faqs = Faq.where(genre: %w[always design]).order(position: :asc)
    @movies = Movie.where(url: Settings.design.movie.to_h.values)
    @price_id = ENV["DESIGN_PRICE_ID"]
    @price = if Rails.env.production?
                Stripe::Price.retrieve(@price_id).unit_amount
              else
                100000
              end
  end

  def success
  end

  def php_lp
  end
end
