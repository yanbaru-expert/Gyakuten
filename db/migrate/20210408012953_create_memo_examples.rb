class CreateMemoExamples < ActiveRecord::Migration[5.2]
  def change
    create_table :memo_examples do |t|
      t.integer :position
      t.text :content, null: false
      t.string :remark

      t.timestamps
    end
  end
end
