class MoviesController < ApplicationController
  def index
    @code_name = Genre.valid_code_name(params[:genre])
    @genre = Genre.convert_display_name(@code_name)
    @movies = Movie.fetch_from(@code_name, params[:page])
    @watched_movie_ids = current_user.watched_movies.pluck(:movie_id)
  end
end
