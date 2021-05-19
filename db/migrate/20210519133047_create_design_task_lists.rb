class CreateDesignTaskLists < ActiveRecord::Migration[5.2]
  def change
    create_table :design_task_lists do |t|
      t.references :design_task_categories_id, foreign_key: true
      t.text :body
      t.timestamps
    end
  end
end
