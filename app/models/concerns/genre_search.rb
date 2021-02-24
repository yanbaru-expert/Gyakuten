module GenreSearch
  extend ActiveSupport::Concern

  included do
    scope :front_group, -> { where(genre_id: Genre.front).includes(:genre).order("genres.position ASC") }
    scope :ruby_group, -> { where(genre_id: Genre.ruby).includes(:genre).order("genres.position ASC") }
    scope :php_group, -> { where(genre_id: Genre.php).includes(:genre).order("genres.position ASC") }
    scope :react_group, -> { where(genre_id: Genre.react).includes(:genre).order("genres.position ASC") }
    scope :vue_group, -> { where(genre_id: Genre.vue).includes(:genre).order("genres.position ASC") }
    scope :angular_group, -> { where(genre_id: Genre.angular).includes(:genre).order("genres.position ASC") }
    scope :aws_group, -> { where(genre_id: Genre.aws).includes(:genre).order("genres.position ASC") }

    scope :general_group, -> { where(genre_id: Genre.general).includes(:genre).order("genres.position ASC") }
    scope :live_group, -> { where(genre_id: Genre.live).includes(:genre).order("genres.position ASC") }

    scope :invisible_group, -> { where(genre_id: Genre.invisible).includes(:genre).order("genres.position ASC") }
    scope :visible_group, -> { where(genre_id: Genre.visible).includes(:genre).order("genres.position ASC") }
  end
end
