# frozen_string_literal: true

class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
end
