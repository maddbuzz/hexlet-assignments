# frozen_string_literal: true

class CreateVacancies < ActiveRecord::Migration[6.1]
  def change
    create_table :vacancies do |t|
      t.string :title
      t.string :description
      # BEGIN
      t.string :aasm_state
      # END

      t.timestamps
    end
  end
end
