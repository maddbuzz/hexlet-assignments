# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  has_many :posts, foreign_key: 'author_id', dependent: :destroy
end
