# frozen_string_literal: true

class CreateRepositories < ActiveRecord::Migration[6.1]
  def change
    create_table :repositories do |t|
      t.string :link
      t.string :owner_name
      t.string :repo_name
      t.text :description
      t.string :default_branch
      t.integer :watchers_count
      t.string :language
      t.datetime :repo_created_at
      t.datetime :repo_updated_at

      t.timestamps
    end
  end
end
