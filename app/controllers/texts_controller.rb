class TextsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    code_name = Genre.valid_code_name(params[:genre])
    @genre = Genre.convert_display_name(code_name)
    @texts = Text.fetch_from(code_name)
    @progresses = current_user.progresses.where(materiable_type: "Text").pluck(:materiable_id)
  end

  def show
    @text = Text.find(params[:id])
    @next_text_id = Text.where(genre_id: @text.genre_id).find_by(position: @text.position + 1)
    if user_signed_in?
      @progresses = current_user.progresses.pluck(:materiable_id)
      @movies = @text.movies.order(:position)
      @progresses = current_user.watched_movies.pluck(:movie_id)
    end
  end
end
