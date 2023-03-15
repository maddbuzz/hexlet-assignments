class UserSerializer < ActiveModel::Serializer
  # attributes :id, :email, :address, :full_name
  attributes :id, :email, :address
  # attribute :full_name

  has_many :posts
end
