# frozen_string_literal: true

class User < ApplicationRecord
  # BEGIN
  has_many :tasks, dependent: :destroy
  # END
end
