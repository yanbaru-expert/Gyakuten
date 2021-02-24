class TextsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    genre_ids = Genre.search_ids(params[:genre])
    @genre = Genre.search_genre(params[:genre])
    @texts = Text.where(genre_id: genre_ids).includes(:genre).order("genres.position ASC").order(:position)
    @read_text_ids = current_user.read_texts.pluck(:text_id) if user_signed_in?
  end

  def show
    @text = Text.find(params[:id])
    @next_text_id = Text.where(genre_id: @text.genre_id).find_by(position: @text.position + 1)
    if user_signed_in?
      @read_text_ids = current_user.read_texts.pluck(:text_id)
      @movies = @text.movies.order(:position)
      @watched_movie_ids = current_user.watched_movies.pluck(:movie_id)
    end
  end
end
