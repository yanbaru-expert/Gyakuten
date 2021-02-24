class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if user_signed_in?
      @q = Question.ransack(params[:q])
      @questions = @q.result.includes(:genre).order("genres.position ASC").order(id: :desc)
      genre_ids = Question.select(:genre_id).distinct.pluck(:genre_id)
      @existence_genres = Genre.where(id: genre_ids).order(position: :asc)
    else
      @questions = Question.includes(:genre).order("genres.position ASC").order(id: :desc)
    end
  end

  def show
    @question = Question.find(params[:id])
  end
end
