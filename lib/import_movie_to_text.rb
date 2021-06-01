class ImportMovieToText
  def self.execute(code_name, index)
    genre = Genre.find_by(code_name: code_name)
    Movie.where(genre_id: genre.id).order(position: :asc).each.with_index(index) do |movie, i|
      movie_params = movie.attributes.slice("title", "genre_id")
      image_path = Rails.root.join("db/fixtures/#{code_name}/#{i.to_s.rjust(2, '0')}.jpg")
      add_params = {
        "content" => "",
        "image" => open(image_path),
      }
      text_params = movie_params.merge add_params
      text = Text.create!(text_params)
      movie.update!(text_id: text.id)
    end
  end
end
