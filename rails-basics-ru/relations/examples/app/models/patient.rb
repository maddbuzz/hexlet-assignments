# frozen_string_literal: true

class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments
end
