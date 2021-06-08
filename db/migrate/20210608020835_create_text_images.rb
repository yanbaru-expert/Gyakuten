class CreateTextImages < ActiveRecord::Migration[5.2]
  def change
    create_table :text_images do |t|
      t.references :user, foreign_key: true
      t.string :image
      t.string :title

      t.timestamps
    end
  end
end
