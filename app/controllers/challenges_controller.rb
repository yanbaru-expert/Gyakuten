class ChallengesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @challenges = if user_signed_in?
                    Challenge.order(id: :asc).includes(:progresses)
                  else
                    Challenge.order(id: :asc)
                  end
  end

  def show
    @challenge = Challenge.find(params[:id])
  end
end
