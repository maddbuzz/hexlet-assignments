# frozen_string_literal: true

class User < ApplicationRecord
  # BEGIN
  has_many :tasks
  # END
end
