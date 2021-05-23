class ChallengesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @challenges = Challenge.order(id: :asc)
    if user_signed_in?
      @progresses = current_user.progresses.where(materiable_type: "Challenge").pluck(:materiable_id)

      # @complete_challenge_ids = current_user.complete_challenges.pluck(:challenge_id)
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
  end
end
