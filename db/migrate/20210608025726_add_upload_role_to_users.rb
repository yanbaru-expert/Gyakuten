class AddUploadRoleToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :upload_role, :boolean, default: false
  end
end
