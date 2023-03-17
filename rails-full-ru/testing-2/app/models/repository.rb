# frozen_string_literal: true

class Repository < ApplicationRecord
  validates :link, presence: true
end
