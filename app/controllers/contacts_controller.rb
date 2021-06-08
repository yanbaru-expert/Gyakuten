class ContactsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :contact_validation, only: [:create]

  def create
    @contact = contact_params
    ContactMailer.admin_email(@contact).deliver_now
    ContactMailer.user_email(@contact).deliver_now
    flash[:notice] = "メールの送信に成功しました。確認メールが届きます。"
    after_contact_page
  end

  private

  def after_contact_page
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:action] == "design"
      redirect_to static_pages_url(anchor: "design_contact")
    else
      redirect_to php_url(anchor: "php_contact")
    end
  end

  def contact_params
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:action] == "design"
      params.permit(:name, :ruby_name, :email, :message).merge(course_name: "Webデザイン")
    else
      params.permit(:name, :ruby_name, :email, :message).merge(course_name: "PHP")
    end
  end

  def contact_validation
    if params[:message].length > 1000 || params[:name].length > 100 || params[:ruby_name].length > 30
      flash[:notice] = "メールの送信に失敗しました。もう一度送信をお願いします"
      after_contact_page
    end
  end
end
