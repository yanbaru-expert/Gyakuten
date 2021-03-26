class CreateFaqs < ActiveRecord::Migration[5.2]
  def change
    create_table :faqs do |t|
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
