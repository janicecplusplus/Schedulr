class AddFirstNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lastname, :string, limit: 20
  end
end
