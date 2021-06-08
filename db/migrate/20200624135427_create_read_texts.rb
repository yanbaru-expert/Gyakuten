class CreateReadTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :read_texts do |t|
      t.integer :user_id, null: false
      t.integer :text_id, null: false

      t.timestamps
    end
    add_index :read_texts, %i[user_id text_id], unique: true
  end
end
