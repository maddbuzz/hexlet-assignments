# frozen_string_literal: true

class Post
  class Comment < ApplicationRecord
    belongs_to :post

    validates :body, presence: true
  end
end
