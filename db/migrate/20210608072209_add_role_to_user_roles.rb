class AddRoleToUserRoles < ActiveRecord::Migration[5.2]
  def change
    add_column :user_roles, :role, :integer, default: 0
  end
end
