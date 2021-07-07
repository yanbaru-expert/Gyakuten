class CreateLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures do |t|
      t.integer :position
      t.string :name
      t.string :lp_url
      t.string :description

      t.timestamps
    end
  end
end
