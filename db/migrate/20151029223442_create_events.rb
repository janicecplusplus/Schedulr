class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.integer :user_id

      t.timestamps null: false
    end

    add_index :events, :user_id
  end
end
