class AddPositionToText < ActiveRecord::Migration[5.2]
  def change
    add_column :texts, :position, :integer
  end
end
