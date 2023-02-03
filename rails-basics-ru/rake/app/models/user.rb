# frozen_string_literal: true

class User < ApplicationRecord
  validates :birthday, :first_name, :last_name, :email, presence: true
end
