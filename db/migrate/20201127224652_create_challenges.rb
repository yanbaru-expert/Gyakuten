class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.integer :position
      t.string :title, null: false
      t.string :theme, null: false
      t.text :question, null: false
      t.text :hint
      t.string :image

      t.timestamps
    end
  end
end
