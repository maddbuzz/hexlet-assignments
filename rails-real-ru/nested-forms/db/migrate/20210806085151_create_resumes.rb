# frozen_string_literal: true

class CreateResumes < ActiveRecord::Migration[6.1]
  def change
    create_table :resumes do |t|
      t.string :name
      t.string :contact
      t.string :github_url
      t.text :summary

      t.timestamps
    end
  end
end
