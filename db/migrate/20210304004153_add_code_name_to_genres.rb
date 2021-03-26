class AddCodeNameToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :code_name, :string
    add_index :genres, :code_name, unique: true
  end
end
