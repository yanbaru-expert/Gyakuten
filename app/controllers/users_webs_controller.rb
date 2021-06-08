class UsersWebsController < ApplicationController
  def index
    @users_webs = UsersWeb.order("id DESC").page(params[:page]).per(10)
  end

  def new
    @users_web = UsersWeb.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @users_webs = UsersWeb.order("id DESC").page(params[:page]).per(10)
    @users_web = UsersWeb.new(users_web_params)
    respond_to do |format|
      if @users_web.save
        format.html
      else
        @message = @users_web.errors.full_messages
      end
      format.js
    end
  end

  def destroy
    @users_webs = UsersWeb.order("id DESC").page(params[:page]).per(10)
    users_web = UsersWeb.find(params[:id])
    respond_to do |format|
      if users_web.destroy
        format.html
        format.js
      else
        format.html { render :index }
      end
    end
  end

  private

  def users_web_params
    params.require(:users_web).permit(:name, :url, :genre)
  end
end
