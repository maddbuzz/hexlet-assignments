# frozen_string_literal: true

class Movie < ApplicationRecord
  validates :title, presence: true

  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
end
