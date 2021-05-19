class CreateProgresses < ActiveRecord::Migration[5.2]
  def change
    create_table :progresses do |t|
      t.references :user, foreign_key: true
      t.references :materiable, polymorphic: true

      t.timestamps
    end
    add_index :progresses, [:user_id, :materiable_id, :materiable_type], unique: true, name: 'progresses_index'
  end
end