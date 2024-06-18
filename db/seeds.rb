# Clear existing data
Booking.destroy_all
Datex.destroy_all
User.destroy_all

# Seed Users
User.create!(
  [
    { email: 'alice@gmail.com', password: '123456' },
    { email: 'bob@gmail.com', password: '123456' },
    { email: 'charlie@gmail.com', password: '123456' }
  ]
)

# Seed Datexes
Datex.create!(
  [
    { title: 'Datex 1', content: 'Content for Datex 1', visibility: true, address: '123 Main St', price: rand(50..200), guests: rand(2..6), category: 'Category A', user: User.find_by(email: 'alice@gmail.com') },
    { title: 'Datex 2', content: 'Content for Datex 2', visibility: true, address: '456 Elm St', price: rand(50..200), guests: rand(2..6), category: 'Category B', user: User.find_by(email: 'alice@gmail.com') },
    { title: 'Datex 3', content: 'Content for Datex 3', visibility: true, address: '789 Maple St', price: rand(50..200), guests: rand(2..6), category: 'Category C', user: User.find_by(email: 'bob@gmail.com') },
    { title: 'Datex 4', content: 'Content for Datex 4', visibility: true, address: '101 Pine St', price: rand(50..200), guests: rand(2..6), category: 'Category D', user: User.find_by(email: 'bob@gmail.com') },
    { title: 'Datex 5', content: 'Content for Datex 5', visibility: true, address: '202 Oak St', price: rand(50..200), guests: rand(2..6), category: 'Category E', user: User.find_by(email: 'charlie@gmail.com') },
    { title: 'Datex 6', content: 'Content for Datex 6', visibility: true, address: '303 Birch St', price: rand(50..200), guests: rand(2..6), category: 'Category F', user: User.find_by(email: 'charlie@gmail.com') }
  ]
)

# Seed Bookings
Booking.create!(
  [
    { fecha: Date.today, user: User.find_by(email: 'alice@gmail.com'), datex: Datex.find_by(title: 'Datex 1') },
    { fecha: Date.today + 1.day, user: User.find_by(email: 'bob@gmail.com'), datex: Datex.find_by(title: 'Datex 3') },
    { fecha: Date.today + 2.days, user: User.find_by(email: 'charlie@gmail.com'), datex: Datex.find_by(title: 'Datex 5') }
  ]
)

puts "Seed data created successfully!"
