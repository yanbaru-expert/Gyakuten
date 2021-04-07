class MemosController < ApplicationController
  def show
    @memo = Memo.find_or_initialize_by(user_id: current_user.id)
  end
  
  def update
    @memo = Memo.find_or_initialize_by(user_id: current_user.id)
  end

  def preview
    
  end
end
