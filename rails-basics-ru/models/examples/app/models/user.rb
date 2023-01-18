class User < ApplicationRecord
  validates :first_name, presence: true
  validates_inclusion_of :role, in: %w( customer admin superuser )
  validates_length_of :last_name, maximum: 15, message: "less than 15 if you don't mind"
  validates :age, numericality: { only_integer: true, greater_than: 17 }
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validate :custom_validation

  attribute :is_active, :boolean, default: -> { false }

  def custom_validation
    errors.add :first_name, 'You are not welcome here, John'  if first_name == 'John'
  end

  # scope :admins, -> {where(role: 'admin') }
  # has_many :orders
  # belongs_to :city

  attribute :is_active, :boolean, default: -> { false }

  scope :customers, -> { where(role: 'customer') }
  scope :admins, -> { where(role: 'admin') }
  scope :superusers, -> { where(role: 'superuser') }
  scope :old_admins, -> { admins.where('age > ?', 60) }
  scope :admins_older_than, -> (age) { admins.where('age > ?', age) }

  # default_scope { admins }
end
