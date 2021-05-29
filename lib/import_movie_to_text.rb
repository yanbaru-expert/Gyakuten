class ImportMovieToText
  def execute(genre_id, index, base_image_name)
    Movie.where(genre_id: genre_id).order(position: :asc).each.with_index(index) do |movie, i|
      movie_params = movie.attributes.slice("title", "genre_id")
      add_params = {
        "content" => "",
        "image" => open("#{Rails.root}/db/fixtures/#{i}_#{base_image_name}.jpg")
      }
      text_params = movie_params.merge add_params
      text = Text.create!(text_params)
      movie.update!(text_id: text.id)
    end
  end
end
