class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  # 【3-2】レスポンシブデザイン
  SAMPLE_MOVIE_DESIGN_URL = "https://www.youtube.com/embed/uSQ2Kw6phs0"
  # 【1-1】デザインとアートの違い(現在ツール部分代用)
  SAMPLE_MOVIE_TOOL_URL = "https://www.youtube.com/embed/QLeskX1PQY0"
  # 【1-3】仕組み化（マーケティング）
  SAMPLE_MOVIE_MARKETING_URL = "https://www.youtube.com/embed/DYEek-SNurI"
  # 本番環境のStripe成功URL
  PRODUCTION_SUCCESS_URL = 'https://www.yanbaru-code.com/design_success'
  # 本番環境のStripeキャンセルURL
  PRODUCTION_CANCEL_URL = 'https://www.yanbaru-code.com/design'
  # ステージング環境のStripe成功URL
  STAGING_SUCCESS_URL = 'https://gyakuten-app-staging.herokuapp.com/design_success'
  # ステージング環境のStripe成功URL
  STAGING_CANCEL_URL = 'https://gyakuten-app-staging.herokuapp.com/design'

  def home
    @faqs = Faq.all
  end

  def design
    @faqs = Faq.all
    @movies = Movie.where(url: [SAMPLE_MOVIE_DESIGN_URL,
                                SAMPLE_MOVIE_TOOL_URL,
                                SAMPLE_MOVIE_MARKETING_URL])
  end

  def success
    if Rails.env.production?
      @success_url = PRODUCTION_SUCCESS_URL
      @cancel_url = PRODUCTION_CANCEL_URL
    else
      @success_url = STAGING_SUCCESS_URL
      @cancel_url = STAGING_CANCEL_URL
    end
  end
end
