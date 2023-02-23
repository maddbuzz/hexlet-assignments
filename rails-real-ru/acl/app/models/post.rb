# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, length: { maximum: 500 }

  belongs_to :author, class_name: 'User'
end
