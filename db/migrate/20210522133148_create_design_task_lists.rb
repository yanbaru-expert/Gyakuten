class CreateDesignTaskLists < ActiveRecord::Migration[5.2]
  def change
    create_table :design_task_lists do |t|
      t.text :body, null: false
      t.references :design_task_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
