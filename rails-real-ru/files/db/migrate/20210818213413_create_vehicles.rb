# frozen_string_literal: true

class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :manufacture
      t.string :model
      t.string :color
      t.integer :doors
      t.integer :kilometrage
      t.date :production_year

      t.timestamps
    end
  end
end
