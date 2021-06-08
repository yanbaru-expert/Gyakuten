class ProgressesController < ApplicationController
  before_action :set_materiable

  def create
    @materiable.progresses.create!(user_id: current_user.id)
  end

  def destroy
    @materiable.progresses.find_by(user_id: current_user.id).destroy!
  end

  private

  def set_materiable
    return unless params[:materiable_type].in?(Progress::MATERIABLES_LIST)

    @materiable = params[:materiable_type].constantize.find(params[:materiable_id])
  end
end
