class ProgressesController < ApplicationController
  def create
    binding.pry
    @progress = params[:materiable_id][:materiable_type]
    current_user.progresses.create!(materiable_id: @progress.materiable_id, materiable_type: @progress.materiable_type)
  end

  def destroy
    @progress = params[:user_id][:materiable_id][:materiable_type]
    Progresses.find_by(user_id: current_user.id, materiable_id: @progress.materiable_id, materiable_type: @progress.materiable_type).destroy!
  end
end
