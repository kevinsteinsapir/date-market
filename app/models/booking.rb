class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :datex
  validates :user_id, :datex_id, :fecha, presence: true
  validate :fecha_format

  private

  def fecha_format
    Date.strptime(fecha, "%d-%m-%Y")
  rescue ArgumentError
    errors.add(:fecha, "must be a valid date in the format dd-mm-yyyy")
  end
end
