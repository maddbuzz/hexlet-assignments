# frozen_string_literal: true

require 'faker'

10.times do
  Post.create(
    title: Faker::Lorem.unique.sentence,
    summary: Faker::Lorem.unique.sentence,
    body: Faker::Lorem.paragraphs.join("\n\n"),
    published: false
  )
end
