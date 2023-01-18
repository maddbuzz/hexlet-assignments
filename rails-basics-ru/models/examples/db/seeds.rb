# db/seeds.rb
User.create(first_name: 'John', last_name: 'Doe', role: 'admin')
User.create(first_name: 'John', last_name: 'Smith', role: 'customer')

100.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    role: %w[customer admin superuser].sample,
    is_active: [true, false].sample
  )
end
