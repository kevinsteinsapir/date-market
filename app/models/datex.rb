class Datex < ApplicationRecord
  belongs_to :user
  has_many :bookings
  CATEGORIES = %w[Category A Category B Category C Category D Category E Category F].freeze
end
