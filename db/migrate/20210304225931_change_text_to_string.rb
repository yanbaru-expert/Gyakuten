class ChangeTextToString < ActiveRecord::Migration[5.2]
  def up
    change_column :movies, :title, :string
    change_column :movies, :url, :string
    change_column :texts, :title, :string
  end

  def down
    change_column :movies, :title, :text
    change_column :movies, :url, :text
    change_column :texts, :title, :text
  end
end
