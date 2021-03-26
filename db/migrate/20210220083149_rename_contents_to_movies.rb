class RenameContentsToMovies < ActiveRecord::Migration[5.2]
  def change
    rename_column :movies, :contents, :url
  end
end
