# frozen_string_literal: true

class CreateResumeWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :resume_works do |t|
      t.references :resume, null: false, foreign_key: true
      t.string :company
      t.date :begin_date
      t.date :end_date

      t.timestamps
    end
  end
end
