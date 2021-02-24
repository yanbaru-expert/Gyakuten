class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.references :genre_group, foreign_key: true, null: false
      t.string :title, null: false
      t.string :color
      t.integer :position

      t.timestamps
    end
  end
end
