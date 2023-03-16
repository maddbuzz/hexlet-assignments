# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = []

300_000.times do |i|
  users << {
    name: "User ##{i}",
    email: "user#{i}@example.com",
    created_at: Time.now,
    updated_at: Time.now
  }
end

users.each_slice(10_000) do |user_slice|
  User.insert_all user_slice
end
