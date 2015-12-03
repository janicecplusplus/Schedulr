class AddConfirmedToFriendship < ActiveRecord::Migration
  def change
    add_column :friendships, :confirmed, :integer, :default => 0, limit: 2
  end
end
