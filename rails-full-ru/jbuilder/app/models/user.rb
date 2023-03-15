# frozen_string_literal: true

class User < ApplicationRecord
  validates :first_name, presence: true
  validates :email, presence: true

  has_many :posts, dependent: :destroy
end
