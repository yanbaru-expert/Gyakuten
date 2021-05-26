class ChallengesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
      @challenges = Challenge.order(id: :asc).includes(:progresses)
  end

  def show
    @challenge = Challenge.find(params[:id])
  end
end
