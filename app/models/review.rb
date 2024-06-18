class Review < ApplicationRecord
  belongs_to :datex

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :comment, presence: true
end
