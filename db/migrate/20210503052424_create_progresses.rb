class CreateProgresses < ActiveRecord::Migration[5.2]
  def change
    create_table :progresses do |t|
      t.references :progressable, polymorphic: true
      t.string :path_name

      t.timestamps
    end
  end
end
