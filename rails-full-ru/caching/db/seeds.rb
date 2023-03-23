# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

articles = []

5_000.times do |_i|
  articles << {
    title: Faker::Superhero.name,
    summary: Faker::Movies::StarWars.quote,
    body: Faker::Hipster.paragraph,
    published_at: Time.now,
    created_at: Time.now,
    updated_at: Time.now
  }
end

articles.each_slice(1_000) do |article_slice|
  Article.insert_all article_slice
end
