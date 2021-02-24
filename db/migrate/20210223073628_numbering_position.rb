class NumberingPosition < ActiveRecord::Migration[5.2]
  def up
    Genre.all.each.with_index(1) do |genre, index|
      genre.update!(position: index)
    end
    GenreGroup.all.each.with_index(1) do |genre_group, index|
      genre_group.update!(position: index)
    end
  end
end
