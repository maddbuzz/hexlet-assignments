# frozen_string_literal: true

class AddFieldsToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :published, :boolean
    add_column :articles, :edited_at, :datetime
  end
end
