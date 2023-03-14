# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |_i|
  name = Faker::TvShows::Friends.character
  name_parts = name.split(' ', 2)
  User.create!(
    first_name: name_parts[0],
    last_name: name_parts[1],
    email: Faker::Internet.email,
    password_digest: BCrypt::Password.create('password'),
    balance: rand(0..10_000),
    address: Faker::TvShows::Friends.location,
    state: %i[active archive].sample
  )
end
