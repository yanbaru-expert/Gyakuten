namespace :text_seed do
  desc "デザイン講座の初期データ投入"
  task design: :environment do
    Movie.where(genre_id: [17, 18, 19]).order(position: :asc).each do |movie|
      text_params = movie.attributes.slice("title", "genre_id").merge({ "content" => "" })
      text = Text.create!(text_params)
      movie.update!(text_id: text.id)
    end
  end
end
