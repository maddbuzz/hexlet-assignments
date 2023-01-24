# frozen_string_literal: true

require 'faker'

10.times do
  Task.create(
    creator: Faker::Name.name,
    performer: Faker::Name.name,
    name: Faker::Lorem.unique.sentence,
    description: Faker::Lorem.paragraphs.join("\n\n"),
    status: 'new',
    completed: false
  )
end
