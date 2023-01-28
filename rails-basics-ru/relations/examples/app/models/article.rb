# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, :body, :author, presence: true

  belongs_to :author

  # scope создаст метод для выборки. Article.published.all выберет все опубликованные статьи
  scope :published, -> { where(published: true) }

  # def self.published
  #   where(published: true)
  # end

  scope :by_creation_date_desc, -> { order(created_at: :desc) }
  scope :by_creation_date_asc, -> { order(created_at: :asc) }
end
