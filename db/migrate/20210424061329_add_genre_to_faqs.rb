class AddGenreToFaqs < ActiveRecord::Migration[5.2]
  def change
    add_column :faqs, :genre, :integer, default: 0
  end
end
