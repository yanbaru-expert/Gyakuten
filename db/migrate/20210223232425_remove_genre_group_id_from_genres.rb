class RemoveGenreGroupIdFromGenres < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :genres, :genre_groups
    remove_reference :genres, :genre_group, index: true
  end
end
