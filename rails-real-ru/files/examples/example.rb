# class User < ApplicationRecord
#   has_one_attached :avatar
#
#   validates :avatar, attached: true,
#                     content_type: %i[png jpg jpeg],
#                     size: { less_than: 5.megabytes }
# end
