# frozen_string_literal: true

class CreateArticlesAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :articles_authors, id: false do |t|
      t.belongs_to :articles
      t.belongs_to :authors
      t.timestamps
    end
  end
end
