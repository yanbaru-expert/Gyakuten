class NumberingPositionToQuestions < ActiveRecord::Migration[5.2]
  def up
    Question.all.each.with_index(1) do |genre, index|
      genre.update!(position: index)
    end
  end
end
