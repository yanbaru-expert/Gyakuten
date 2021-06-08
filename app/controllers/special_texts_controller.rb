class SpecialTextsController < ApplicationController
  PER_PAGE = 50
  before_action :ensure_correct_user
  before_action :set_updatable_genre_list, only: %i[index edit update destroy]
  before_action :set_text, only: %i[show edit update destroy]
  before_action :has_role, only: %i[edit update destroy]

  def index
    @q = Text.where(genre_id: @special_genre_ids).ransack(params[:q])
    @texts = @q.result.order(:position).includes(:genre).page(params[:page]).per(PER_PAGE)
  end

  def new
    @text = Text.new
    @selectable_genre_list = Genre.where(id: @special_genre_ids).pluck(:name, :id)
  end

  def create
    if params[:text][:genre_id].to_i.in?(@special_genre_ids)
      text_params = params.require(:text).permit(:genre_id, :image, :title, :content)
      text = Text.create!(text_params)
      redirect_to special_text_path(text), notice: "テキスト教材を作成しました。"
    else
      redirect_to special_texts_path, alert: "権限がありません。"
    end
  end

  def show
    @user_role = current_user.user_roles.find_by(genre_id: @text.genre_id)
  end

  def edit
    @selectable_genre_list = Genre.where(id: @updatable_genre_ids).pluck(:name, :id)
    @selectable_positions = Text.where(genre_id: @text.genre_id).order(:position).pluck(:position)
  end

  def update
    genre_id = params[:text][:genre_id].to_i
    redirect_to special_texts_path, alert: "権限がありません。" and return unless genre_id.in?(@updatable_genre_ids)

    text_params = if @text.genre_id == genre_id
                    params.require(:text).permit(:position, :image, :title, :content)
                  else
                    params.require(:text).permit(:genre_id, :image, :title, :content).merge({ position: nil })
                  end
    @text.update!(text_params)
    Text.position_sort!
    redirect_to special_text_path(@text), notice: "テキスト教材を更新しました。"
  end

  def destroy
    @text.destroy!
    Text.position_sort!
    redirect_to special_texts_path, alert: "テキスト教材を削除しました。"
  end

  private

  def ensure_correct_user
    redirect_to root_path if @special_genre_ids.blank?
  end

  def set_updatable_genre_list
    @updatable_genre_ids = current_user.user_roles.where(role: "full_authority").pluck(:genre_id)
  end

  def set_text
    @text = Text.where(genre_id: @special_genre_ids).find(params[:id])
  end

  def has_role
    redirect_to special_texts_path, alert: "権限がありません。" unless @text.genre_id.in?(@updatable_genre_ids)
  end
end
