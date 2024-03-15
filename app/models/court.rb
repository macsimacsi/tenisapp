class Court < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search, against: [:name, :address, :description, :price],
                            using: {
                              tsearch: { prefix: true }
                            }
end
