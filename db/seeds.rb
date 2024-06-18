# Clear existing data
Booking.destroy_all
Datex.destroy_all
User.destroy_all

# Seed Users
users = User.create!([
  { email: 'alice@gmail.com', encrypted_password: '123456' },
  { email: 'bob@gmail.com', encrypted_password: '123456' },
  { email: 'charlie@gmail.com', encrypted_password: '123456' }
])

# Seed Datexes
datexes = Datex.create!([
  { title: 'Datex 1', content: 'Content for Datex 1', visibility: true, address: '123 Main St', price: rand(50..200), guests: rand(2..6), category: 'Category A', user: users[0] },
  { title: 'Datex 2', content: 'Content for Datex 2', visibility: true, address: '456 Elm St', price: rand(50..200), guests: rand(2..6), category: 'Category B', user: users[0] },
  { title: 'Datex 3', content: 'Content for Datex 3', visibility: true, address: '789 Maple St', price: rand(50..200), guests: rand(2..6), category: 'Category C', user: users[1] },
  { title: 'Datex 4', content: 'Content for Datex 4', visibility: true, address: '101 Pine St', price: rand(50..200), guests: rand(2..6), category: 'Category D', user: users[1] },
  { title: 'Datex 5', content: 'Content for Datex 5', visibility: true, address: '202 Oak St', price: rand(50..200), guests: rand(2..6), category: 'Category E', user: users[2] },
  { title: 'Datex 6', content: 'Content for Datex 6', visibility: true, address: '303 Birch St', price: rand(50..200), guests: rand(2..6), category: 'Category F', user: users[2] }
])

# Seed Bookings
bookings = Booking.create!([
  { fecha: Date.today, user: users[0], datex: datexes[0] },
  { fecha: Date.today + 1.day, user: users[1], datex: datexes[2] },
  { fecha: Date.today + 2.days, user: users[2], datex: datexes[4] }
])

puts "Seed data created successfully!"
