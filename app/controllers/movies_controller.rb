class MoviesController < ApplicationController
  PER_PAGE = 18

  def index
    genre_ids = Genre.search_ids(params[:genre])
    @genre = Genre.search_genre(params[:genre])
    @movies = Movie.where(genre_id: genre_ids).
                order(:position).
                page(params[:page]).
                per(PER_PAGE).
                includes(:genre)
    @watched_movie_ids = current_user.watched_movies.pluck(:movie_id)
  end
end
