class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :datex
  validates :user_id, :datex_id, :fecha, presence: true
end
