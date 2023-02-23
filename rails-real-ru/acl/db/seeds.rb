# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |_i|
  User.create!(
    name: Faker::TvShows::Friends.character,
    email: Faker::Internet.email,
    password: 'password',
    admin: Faker::Boolean.boolean
  )
end

users = User.all

20.times do |_i|
  user = users.sample
  Post.create!(
    title: "#{user.name} say",
    body: Faker::TvShows::Friends.quote,
    author: user
  )
end
