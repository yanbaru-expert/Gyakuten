class TextsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @texts = Text.show_contents_list(params[:genre])
  end

  def show
    @text = Text.find(params[:id])
  end

  private

    def move_to_index
      redirect_to action: :index, flash: { error: "ログインしてください" } unless user_signed_in?
    end
end
