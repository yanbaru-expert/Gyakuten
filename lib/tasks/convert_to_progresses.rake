namespace :convert_to_progresses do
  desc "既存のReadTexts、CompleteChallenges、WachedMoviesテーブルのコンバート"
  task execute: :environment do
    read_texts = ReadText.all
    read_texts.each do |read_text|
      Progress.create(user: read_text.user, materiable: read_text.text)
    end

    watched_movies = WatchedMovie.all
    watched_movies.each do |watched_movie|
      Progress.create(user: watched_movie.user, materiable: watched_movie.movie)
    end

    complete_challenges = CompleteChallenge.all
    complete_challenges.each do |complete_challenge|
      Progress.create(user: complete_challenge.user, materiable: complete_challenge.challenge)
    end
  end
end



namespace :convert_to_progresses do
  desc "既存のReadTexts、CompleteChallenges、WachedMoviesテーブルのコンバート"
  task execute: :environment do
    ReadText.find_each do |read_text|
      Progress.create!(user_id: read_text.user_id, materiable_id: read_text.text_id, materiable_type: "Text")
    end

    WatchedMovie.find_each do |watched_movie|
      Progress.create!(user_id: watched_movie.user_id, materiable_id: watched_movie.movie_id, materiable_type: "Movie")
    end

    CompleteChallenge.find_each do |complete_challenge|
      Progress.create!(user_id: complete_challenge.user, materiable_id: complete_challenge.challenge, materiable_type: "Challenge")
    end
  end
end
