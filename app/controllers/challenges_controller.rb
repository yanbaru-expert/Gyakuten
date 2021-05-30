class ChallengesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if user_signed_in?
      @challenges = Challenge.order(id: :asc).includes(:progresses)
    else
      @challenges = Challenge.order(id: :asc)
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
  end
end
