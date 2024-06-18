class Datex < ApplicationRecord
  belongs_to :user
  CATEGORIES = %w[Category A Category B Category C Category D Category E Category F].freeze
  has_many :bookings #dependant: :destroy
  has_many :reviews #dependant: :destroy
end
