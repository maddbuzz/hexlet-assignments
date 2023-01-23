# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  author     :string
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Article < ApplicationRecord
  # https://guides.rubyonrails.org/active_record_validations.html
  validates :title, :body, :author, presence: true
  # validates :title, :body, :author, format: { with: /\A[a-zA-Z]+\z/,
  #   message: "only allows letters" }
end
