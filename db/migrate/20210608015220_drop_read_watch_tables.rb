class DropReadWatchTables < ActiveRecord::Migration[5.2]
  def up
    remove_index :read_texts, %i[user_id text_id]
    remove_index :watched_movies, %i[user_id movie_id]
    drop_table :read_texts
    drop_table :watched_movies
    drop_table :complete_challenges
  end

  def down
    create_table :read_texts do |t|
      t.integer :user_id, null: false
      t.integer :text_id, null: false

      t.timestamps
    end
    create_table :watched_movies do |t|
      t.integer :user_id, null: false
      t.integer :movie_id, null: false

      t.timestamps
    end
    create_table :complete_challenges do |t|
      t.references :user, foreign_key: true
      t.references :challenge, foreign_key: true

      t.timestamps
    end
    add_index :watched_movies, %i[user_id movie_id], unique: true
    add_index :read_texts, %i[user_id text_id], unique: true
  end
end
