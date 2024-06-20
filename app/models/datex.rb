class Datex < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search,
                  against: %i[title content address],
                  using: {
                    tsearch: { prefix: true }
                  }

  belongs_to :user
  has_one_attached :photo

  CATEGORIES = [
    'Romantic',
    'Sports',
    'City Tour',
    'Outdoors',
    'Friendly',
    'Restaurants',
    'Culture',
    'Fancy',
    'Other'
  ].freeze
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :title, :content, :address, :price, :guests, :category, presence: true
  validates :guests, numericality: { greater_than_or_equal_to: 2 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :category, inclusion: { in: CATEGORIES }
end
