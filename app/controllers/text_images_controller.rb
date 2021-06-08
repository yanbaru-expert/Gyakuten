class TextImagesController < ApplicationController
  before_action :ensure_correct_user

  PER_PAGE = 20

  def index
    @text_image = TextImage.new
    @text_images = current_user.text_images.order(created_at: :desc).page(params[:page]).per(PER_PAGE)
  end

  def create
    current_user.text_images.create!(text_image_params)
    redirect_to text_images_path, notice: "投稿しました。"
  end

  def destroy
    current_user.text_images.find(params[:id]).destroy!
    redirect_to text_images_path, alert: "削除しました。"
  end

  private

  def text_image_params
    params.require(:text_image).permit(:title, :image)
  end

  def ensure_correct_user
    redirect_to root_path unless current_user.upload_role
  end
end
