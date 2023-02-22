# frozen_string_literal: true

class CreateResumeEducations < ActiveRecord::Migration[6.1]
  def change
    create_table :resume_educations do |t|
      t.references :resume, null: false, foreign_key: true

      t.string :institution
      t.string :faculty
      t.date :begin_date
      t.date :end_date

      t.timestamps
    end
  end
end
