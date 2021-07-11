class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    @faqs = Faq.where(genre: %w[always top]).order(position: :asc)
    @lectures = Lecture.order(position: :asc)
  end

  def design
    @faqs = Faq.where(genre: %w[invisible always design]).order(position: :asc)
    @movies = Movie.where(url: Settings.design.movie.to_h.values)
    @price_id = ENV["DESIGN_PRICE_ID"]
    @price = if Rails.env.production?
               Stripe::Price.retrieve(@price_id).unit_amount
             else
               100_000
             end
  end

  def design_success; end

  def php
    @faqs = Faq.where(genre: %w[invisible always design]).order(position: :asc)
    @price_id = ENV["PHP_PRICE_ID"]
    @price = if Rails.env.production?
               Stripe::Price.retrieve(@price_id).unit_amount
             else
               150_000
             end
  end

  def php_success; end
end
