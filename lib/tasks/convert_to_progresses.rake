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
