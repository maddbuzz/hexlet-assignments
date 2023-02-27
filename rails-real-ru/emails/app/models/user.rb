# frozen_string_literal: true

class User < ApplicationRecord
  include AASM

  before_create :generate_confirmation_token

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  aasm whiny_transitions: false do
    state :waiting_confirmation, initial: true
    state :active

    event :activate do
      transitions from: :waiting_confirmation, to: :active
    end
  end

  def generate_confirmation_token
    self.confirmation_token = SecureRandom.urlsafe_base64
  end
end
