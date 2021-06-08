class CreateWatchedMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :watched_movies do |t|
      t.integer :user_id, null: false
      t.integer :movie_id, null: false

      t.timestamps
    end
    add_index :watched_movies, %i[user_id movie_id], unique: true
  end
end
