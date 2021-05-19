class CreateDesignTaskCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :design_task_categories do |t|
      t.string :name
      t.string :img

      t.timestamps
    end
  end
end
