# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  desc       :text
#  position   :integer
#  title      :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  genre_id   :integer
#  text_id    :integer
#
# Foreign Keys
#
#  fk_rails_...  (genre_id => genres.id)
#

require "rails_helper"

RSpec.describe Movie, type: :model do
  context "title と content と genre が存在するとき" do
    let(:movie) { create(:movie) }
    it "動画の記事が作られる" do
      expect(movie).to be_valid
    end
  end

  context "title が存在しないとき" do
    let(:movie) { build(:movie, title: nil) }
    it "エラーする" do
      expect(movie).not_to be_valid
      expect(movie.errors.messages[:title]).to include "を入力してください"
    end
  end

  context "content が存在しないとき" do
    let(:movie) { build(:movie, url: nil) }
    it "エラーする" do
      expect(movie).not_to be_valid
      expect(movie.errors.messages[:url]).to include "を入力してください"
    end
  end

  context "genre が存在しないとき" do
    let(:movie) { build(:movie, genre: nil) }
    it "エラーする" do
      expect(movie).not_to be_valid
      expect(movie.errors.messages[:genre]).to include "を入力してください"
    end
  end
end
