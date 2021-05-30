namespace :convert_to_progresses do
  desc "既存のReadTexts、CompleteChallenges、WachedMoviesテーブルのコンバート"
  task execute: :environment do
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE progresses RESTART IDENTITY CASCADE")

    ReadText.find_each do |read_text|
      Progress.create!(user_id: read_text.user_id, materiable_id: read_text.text_id, materiable_type: "Text")
    end

    WatchedMovie.find_each do |watched_movie|
      Progress.create!(user_id: watched_movie.user_id, materiable_id: watched_movie.movie_id, materiable_type: "Movie")
    end

    CompleteChallenge.find_each do |complete_challenge|
      Progress.create!(user_id: complete_challenge.user_id, materiable_id: complete_challenge.challenge_id, materiable_type: "Challenge")
    end
  end
end