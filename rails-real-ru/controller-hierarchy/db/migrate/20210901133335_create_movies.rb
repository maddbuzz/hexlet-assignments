# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title, nullify: false
      t.text :description

      t.timestamps
    end
  end
end
