class MoviesController < ApplicationController
  def index
    @code_name = Genre.valid_code_name(params[:genre])
    @genre = Genre.convert_display_name(@code_name)
    @movies = Movie.fetch_from(@code_name, params[:page])
    @progresses = current_user.progresses.where(materiable_type: "Movie").pluck(:materiable_id)
  end
end
