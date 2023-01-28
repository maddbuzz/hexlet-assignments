# frozen_string_literal: true

class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.datetime :appointment_date

      t.belongs_to :doctor
      t.belongs_to :patient

      t.timestamps
    end
  end
end
