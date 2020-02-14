class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @level = Movie.count_level(params[:page])
    @movies = categorized_movies
    @content_name = params[:content_name]
  end

  private

    def categorized_movies
      case params[:content_name]
      when "lives"
        Movie.disp_lives(params[:page])

      when "phps"
        Movie.disp_phps(params[:page])

      when "talks"
        Movie.disp_talks(params[:page])

      when "videoedittings"
        Movie.disp_modvieedittings(params[:page])

      when "writings"
        Movie.disp_writings(params[:page])

      when "marketings"
        Movie.disp_marketings(params[:page])
      # params[:content_name]がない場合は動画教材ページを表示する
      else
        Movie.disp_programming(params[:page])
      end
    end
end
