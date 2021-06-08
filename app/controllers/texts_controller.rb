class TextsController < ApplicationController
  include DesignTask
  skip_before_action :authenticate_user!
  before_action :set_design_task, only: :index

  def index
    code_name = Genre.valid_code_name(params[:genre])
    @genre = Genre.convert_display_name(code_name)
    @texts = if user_signed_in?
               Text.fetch_from(code_name).includes(:progresses)
             else
               Text.fetch_from(code_name)
             end
  end

  def show
    @text = Text.find(params[:id])
    if user_signed_in?
      @next_text_id = Text.where(genre_id: @text.genre_id).find_by(position: @text.position + 1)
      @movies = @text.movies.order(:position)
    end
  end
end
