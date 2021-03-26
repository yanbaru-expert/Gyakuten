class RenameContentsToContent < ActiveRecord::Migration[5.2]
  def change
    rename_column :lines, :contents, :content
    rename_column :money, :contents, :content
    rename_column :texts, :contents, :content
    rename_column :questions, :body, :content
  end
end
