class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.date :fecha
      t.references :user, null: false, foreign_key: true
      t.references :datex, null: false, foreign_key: true

      t.timestamps
    end
  end
end
