# frozen_string_literal: true

class Repository < ApplicationRecord
  validates :link, presence: true, uniqueness: true

  # BEGIN
  include AASM

  aasm do
    state :created, initial: true
    state :fetching
    state :fetched
    state :failed

    event :fetch do
      transitions from: %i[created fetched failed], to: :fetching
    end

    event :rollback do
      transitions from: :fetching, to: :created
    end

    event :mark_as_fetched do
      transitions from: :fetching, to: :fetched
    end

    event :mark_as_failed do
      transitions to: :failed
    end
  end
  # END
end
