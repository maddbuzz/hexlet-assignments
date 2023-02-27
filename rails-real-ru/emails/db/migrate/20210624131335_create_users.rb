# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.string :aasm_state
      t.string :confirmation_token
      t.datetime :aconfirmed_at

      t.timestamps
    end
  end
end
