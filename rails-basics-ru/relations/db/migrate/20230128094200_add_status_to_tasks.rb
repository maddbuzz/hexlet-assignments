# frozen_string_literal: true

class AddStatusToTasks < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :status, null: false, foreign_key: true
  end
end
