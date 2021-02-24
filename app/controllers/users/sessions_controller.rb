# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    # Deviseのログイン維持期間はデフォルトの2週間で設定中
    # やんばるCODEの方は，前回のチェックから1週間以上経過している場合は，再度Slackに問い合わせる
    # 削除済みアカウントになっている場合は承認を取り消す
    # ただし，本番環境以外では問い合わせを行わないとする
    if Rails.env.production? && resource.flag && resource.slack_name == "yanbaru_code" && Time.current > resource.approval_at + 7.days
      client = AutoSlackApproval.new(slack_name: resource.slack_name, slack_id: resource.slack_id)
      resource.update!(flag: client.approval?, approval_at: Time.current)
    end
    # 以上を追加
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
