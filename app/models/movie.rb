# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  title      :text
#  contents   :text
#  desc       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  genre      :string
#

class Movie < ApplicationRecord
  PER_PAGE = 10
  PROGRAMMING = ["Basic", "git", "Ruby", "Ruby on Rails", "AWS"].freeze

  def self.count_level(page)
    (self.page(page).current_page - 1) * PER_PAGE + 1
  end

  def self.disp_programming(page)
    Movie.where(genre: PROGRAMMING).order("id ASC").page(page).per(PER_PAGE)
  end

  def self.disp_money(page)
    Movie.where(genre: "Money").order("id ASC").page(page).per(PER_PAGE)
  end

  def self.disp_salon(page)
    Movie.where(genre: "Salon").order("id DESC").page(page).per(PER_PAGE)
  end

  def self.disp_talks(page)
    Movie.where(genre: "Talk").order("id DESC").page(page).per(PER_PAGE)
  end

  def self.disp_modvieedittings(page)
    Movie.where(genre: "Movie").order("id ASC").page(page).per(PER_PAGE)
  end

  def self.disp_writings(page)
    Movie.where(genre: "Writing").order("id ASC").page(page).per(PER_PAGE)
  end

  def self.disp_phps(page)
    Movie.where(genre: "Php").order("id ASC").page(page).per(PER_PAGE)
  end

  def self.disp_lives(page)
    Movie.where(genre: "Live").order("id DESC").page(page).per(PER_PAGE)
  end

  def self.disp_marketings(page)
    Movie.where(genre: "Marketing").order("id DESC").page(page).per(PER_PAGE)
  end
end
