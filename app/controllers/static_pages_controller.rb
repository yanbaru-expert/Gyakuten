class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  # 【3-2】レスポンシブデザイン
  SAMPLE_MOVIE_DESIGN_URL = "https://www.youtube.com/embed/uSQ2Kw6phs0"
  # 【1-1】デザインとアートの違い(現在ツール部分代用)
  SAMPLE_MOVIE_TOOL_URL = "https://www.youtube.com/embed/QLeskX1PQY0"
  # 【1-3】仕組み化（マーケティング）
  SAMPLE_MOVIE_MARKETING_URL = "https://www.youtube.com/embed/DYEek-SNurI"

  def home
    @faqs = Faq.where(genre: %w[always top]).order(position: :asc)
  end

  def design
    @faqs = Faq.where(genre: %w[always design]).order(position: :asc)
    @movies = Movie.where(url: [SAMPLE_MOVIE_DESIGN_URL,
                                SAMPLE_MOVIE_TOOL_URL,
                                SAMPLE_MOVIE_MARKETING_URL]
                              )
    @price_id = ENV["DESIGN_PRICE_ID"]
    @price = if Rails.env.production?
               Stripe::Price.retrieve(price_id).unit_amount
             else
               100000
             end
  end

  def success
  end
end
