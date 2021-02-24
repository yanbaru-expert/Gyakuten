class ChangeSlackNameType < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :slack_name, "integer USING CAST(slack_name AS integer)"
  end
end
