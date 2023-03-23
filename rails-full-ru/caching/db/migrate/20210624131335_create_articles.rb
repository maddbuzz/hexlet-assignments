# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :summary, null: false
      t.text :body, null: false
      t.datetime :published_at

      t.timestamps
    end
  end
end
