# frozen_string_literal: true

class CreateBulletins < ActiveRecord::Migration[6.1]
  def change
    create_table :bulletins do |t|
      t.string :title
      t.text :body
      t.boolean :published

      t.timestamps
    end
  end
end
