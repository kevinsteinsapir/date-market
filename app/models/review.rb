class Review < ApplicationRecord
  belongs_to :datex
  belongs_to :user

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :comment, :datex, presence: true

end
