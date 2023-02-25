# frozen_string_literal: true

class Vehicle < ApplicationRecord
  # BEGIN
  has_one_attached :image
  # END

  validates :manufacture, presence: true
  validates :model, presence: true
  validates :color, presence: true
  validates :doors, presence: true, numericality: { only_integer: true }
  validates :kilometrage, presence: true, numericality: { only_integer: true }
  validates :production_year, presence: true

  # BEGIN
  validates :image, attached: true,
                    content_type: %i[png jpg jpeg],
                    size: { less_than: 5.megabytes }
  # END
end
