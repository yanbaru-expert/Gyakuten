# == Schema Information
#
# Table name: texts
#
#  id            :bigint           not null, primary key
#  contents      :text
#  description   :string
#  genre         :string
#  title         :text
#  twitter_image :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Text < ApplicationRecord
  PROGRAMMING = ["Basic", "git", "Ruby", "Ruby on Rails"].freeze
  AWS = ["AWS"].freeze
  LINE = ["想い", "インプット", "転職活動", "プログラミング学習", "自己投資", "習慣化", "思考",
          "マインド", "効率化", "収益化", "情報発信", "価値観"].freeze

  def self.show_contents_list(genre)
    case genre
    when "programming"
      Text.where(genre: PROGRAMMING).order("id ASC")
    when "aws"
      Text.where(genre: AWS).order("id ASC")
    when "line"
      Text.where(genre: LINE).order("id ASC")
    else
      Text.where(genre: genre).order("id ASC")
    end
  end
end
