class AddAttributesToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :age, :integer
    add_column :users, :email, :string
  end
end
