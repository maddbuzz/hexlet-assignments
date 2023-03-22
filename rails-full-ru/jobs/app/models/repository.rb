# frozen_string_literal: true

class Repository < ApplicationRecord
  validates :link, presence: true, uniqueness: true

  # BEGIN
  include AASM

  aasm column: 'aasm_state' do
    state :created, initial: true
    state :fetching, :fetched, :failed

    event :to_fetching do
      transitions from: :created, to: :fetching
    end

    event :to_fetched do
      transitions from: :fetching, to: :fetched
    end

    event :to_failed do
      transitions from: :fetching, to: :failed
    end
  end
  # END
end
