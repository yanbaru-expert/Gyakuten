class CreateDesignTaskCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :design_task_categories do |t|
      t.integer :position
      t.string :name, null: false
      t.string :image

      t.timestamps
    end
  end
end
