module GenreSearch
  extend ActiveSupport::Concern

  included do
    scope :search_group, ->(code_name) { joins(:genre).where(genres: { code_name: code_name }).order("genres.position ASC").order(:position) }
    scope :search_order_created_at, lambda { |code_name, order = :asc|
                                      joins(:genre).where(genres: { code_name: code_name }).order("genres.position ASC").order(created_at: order)
                                    }

    scope :front_group, -> { search_group(Genre::FRONT) }
    scope :ruby_group, -> { search_group(Genre::RUBY) }
    scope :live_group, -> { search_order_created_at(Genre::LIVE, :desc) }
    scope :money_group, -> { search_order_created_at(Genre::MONEY) }

    scope :general_group, -> { joins(:genre).where.not(genres: { code_name: Genre::IN_GENERAL }).order("genres.position ASC").order(:position) }
  end
end
