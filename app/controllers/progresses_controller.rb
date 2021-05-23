class ProgressesController < ApplicationController
  def create
    current_user.progresses.create!(materiable_id: params[:materiable_id], materiable_type: params[:materiable_type])
    
  end

  def destroy
    Progress.find_by(user_id: current_user.id, materiable_id: params[:materiable_id], materiable_type: params[:materiable_type]).destroy!
  end
end
