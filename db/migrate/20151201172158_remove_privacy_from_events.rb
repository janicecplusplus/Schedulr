class RemovePrivacyFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :events, :integer
  end
end
