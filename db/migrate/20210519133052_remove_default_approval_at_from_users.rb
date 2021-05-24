class RemoveDefaultApprovalAtFromUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :approval_at, from: Time.current, to: nil
  end
end
