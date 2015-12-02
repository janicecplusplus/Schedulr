class AddPrivacyToEvents < ActiveRecord::Migration
  def change
    add_column :events, :events, :integer
  end
end
