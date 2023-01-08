# frozen_string_literal: true

require_relative './model'
require 'date'

class Post
  include Model

  attribute :id, type: :integer
  attribute :title, type: :string
  attribute :body, type: :string
  attribute :created_at, type: :datetime
  attribute :published, type: :boolean
end
