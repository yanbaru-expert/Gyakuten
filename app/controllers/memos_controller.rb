class MemosController < ApplicationController
  def show
    @memo = Memo.find_or_initialize_by(user_id: current_user.id)
    @memo_examples = MemoExample.order(position: :asc)
  end

  def update
    @memo = Memo.find_or_initialize_by(user_id: current_user.id)
    @memo.update!(memo_params)
  end

  def preview
    @memo = Memo.find_by(user_id: current_user.id)
  end

  private

  def memo_params
    params.require(:memo).permit(:content)
  end
end
