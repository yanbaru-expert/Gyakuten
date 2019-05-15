class MoviesController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    page = params[:page]
    @level = Movie.count_level(page)
    @movies = Movie.disp_programming(page)
  end

  def show
    @movie = Movie.find(params[:id])
  end

  private

  def move_to_index
    flash[:error] = "ログインしてください" unless user_signed_in?
  end

end
