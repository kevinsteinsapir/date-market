class Datex < ApplicationRecord
  belongs_to :user
  has_many :bookings #dependant: :destroy
  has_many :reviews #dependant: :destroy
end
