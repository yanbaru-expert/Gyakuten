class MoviesController < ApplicationController
  include DesignTask
  before_action :set_design_task, only: :index

  def index
    @code_name = Genre.valid_code_name(params[:genre])
    @genre = Genre.convert_display_name(@code_name)
    if user_signed_in?
      @movies = Movie.fetch_from(@code_name, params[:page]).includes(:progresses)
    else
      @movies = Movie.fetch_from(@code_name, params[:page])
    end
  end
end
