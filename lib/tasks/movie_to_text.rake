require "import_movie_to_text"

namespace :movie_to_text do
  desc "デザイン講座の動画教材に対応するテキスト教材を作成"
  task genre: :environment do
    design_genres = %w[design_base design_matter design_task]
    design_genres.each do |genre|
      ImportMovieToText.execute(genre, 1)
    end
  end
end
