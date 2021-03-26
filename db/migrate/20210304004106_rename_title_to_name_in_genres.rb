class RenameTitleToNameInGenres < ActiveRecord::Migration[5.2]
  def change
    rename_column :genres, :title, :name
  end
end
