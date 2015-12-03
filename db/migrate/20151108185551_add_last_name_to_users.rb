class AddLastNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string, limit: 20
  end
end
