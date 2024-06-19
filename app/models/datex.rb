class Datex < ApplicationRecord
  belongs_to :user
  CATEGORIES = %w[Category A Category B Category C Category D Category E Category F].freeze
  has_many :bookings #dependant: :destroy
  has_many :reviews #dependant: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
