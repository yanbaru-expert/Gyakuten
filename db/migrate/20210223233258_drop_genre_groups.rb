class DropGenreGroups < ActiveRecord::Migration[5.2]
  def change
    drop_table :genre_groups do |t|
      t.string :title, null: false
      t.integer :position

      t.timestamps
    end
  end
end
