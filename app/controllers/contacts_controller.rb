class ContactsController < ApplicationController
  before_action :contact_validation, only: [:create]

  def create
    @contact = contact_params
    ContactMailer.admin_email(@contact).deliver_now
    ContactMailer.user_email(@contact).deliver_now
    flash[:notice] = "メールの送信に成功しました。確認メールが届きます。"
    redirect_to static_pages_url(anchor: "design_contact")
  end

  private

    def contact_params
      params.permit(:name, :ruby_name, :email, :message)
    end

    def contact_validation
      if params[:message].length > 1000 || params[:name].length > 100 || params[:ruby_name].length > 30
        flash[:notice] = "メールの送信に失敗しました。もう一度送信をお願いします"
        redirect_to static_pages_url(anchor: "design_contact")
      end
    end
end
