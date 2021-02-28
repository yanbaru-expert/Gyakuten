class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :heroku_staging?
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :sign_out_user, if: :user_signed_in?
  before_action :set_genres

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit :sign_up, keys: [:slack_name, :slack_id]
    end

    def sign_out_user
      unless current_user.flag
        flash.clear
        flash.now[:alert] = "現在参加中のサロンのSlack IDで新規登録をお願いいたします。"
        sign_out(current_user)
      end
    end

  private

    def heroku_staging?
      request.url.include?("gyakuten-app-staging.herokuapp.com")
    end

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
      end
    end

    def set_genres
      @convert_display_name = Genre.pluck(:code_name, :name).to_h
    end
end
