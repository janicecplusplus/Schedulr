class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, limit: 40
      t.string :description, limit: 100
      t.datetime :start_time
      t.datetime :end_time
      t.integer :user_id

      t.timestamps null: false
    end

    ###add_index :events, :user_id
  end
end
