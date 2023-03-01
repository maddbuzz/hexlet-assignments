# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |_i|
  Movie.create!(
    title: Faker::Movie.title,
    description: Faker::Lorem.paragraph
  )
end

movies = Movie.all

movies.each do |movie|
  times = [1..20].sample
  times.each do |_k|
    movie.reviews.create!(body: Faker::Lorem.paragraph)
    movie.comments.create!(body: Faker::TvShows::Friends.quote)
  end
end
