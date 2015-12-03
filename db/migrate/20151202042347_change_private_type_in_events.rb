class ChangePrivateTypeInEvents < ActiveRecord::Migration
  def change
    change_column :events, :private, :boolean, :null => false, :default => false
  end
end
