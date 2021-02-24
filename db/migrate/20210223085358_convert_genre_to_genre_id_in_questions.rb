class ConvertGenreToGenreIdInQuestions < ActiveRecord::Migration[5.2]
  def up
    genre_list = {
      "Basic" => 1,
      "Git" => 2,
      "Ruby" => 3,
      "Ruby on Rails" => 4,
      "PHP" => 5,
      "HTML&CSS" => 6,
      "JavaScript" => 7,
      "TypeScript" => 8,
      "React" => 9,
      "Vue" => 10,
      "Angular" => 11,
      "AWS" => 12,
      "Money" => 13,
      "Talk" => 14,
      "Live" => 15,
      "Other" => 16,
    }
    genre_list.each_key do |genre|
      Question.where(genre: genre).update(genre: genre_list[genre])
    end
  end
end
