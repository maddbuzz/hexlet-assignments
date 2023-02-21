# frozen_string_literal: true

class Post < ApplicationRecord
  include AASM

  validates :title, presence: true
  validates :body, length: { maximum: 500 }

  aasm do
    state :draft, initial: true
    state :published

    event :publish do
      transitions from: :draft, to: :published
    end
  end
end
