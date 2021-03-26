class RenameGenreToGenreId < ActiveRecord::Migration[5.2]
  def change
    rename_column :movies, :genre, :genre_id
    rename_column :texts, :genre, :genre_id
    change_column :movies, :genre_id, "integer USING CAST(genre_id AS integer)"
    change_column :texts, :genre_id, "integer USING CAST(genre_id AS integer)"
    add_foreign_key :movies, :genres
    add_foreign_key :texts, :genres
  end
end
