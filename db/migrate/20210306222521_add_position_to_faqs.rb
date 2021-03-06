class AddPositionToFaqs < ActiveRecord::Migration[5.2]
  def change
    add_column :faqs, :position, :integer
  end
end
