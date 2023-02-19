# frozen_string_literal: true

class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.text :body
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
