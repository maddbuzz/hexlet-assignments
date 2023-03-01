# frozen_string_literal: true

class Review < ApplicationRecord
  validates :body, presence: true

  belongs_to :movie
end
