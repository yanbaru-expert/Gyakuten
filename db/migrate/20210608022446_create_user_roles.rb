class CreateUserRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_roles do |t|
      t.references :user, foreign_key: true, null: false
      t.references :genre, foreign_key: true, null: false

      t.timestamps
    end
    add_index :user_roles, %i[user_id genre_id], unique: true
  end
end
