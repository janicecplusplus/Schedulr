class GroupifyMigration < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string   :type, limit: 10
      t.string :title, limit: 40
      t.string :description, limit: 100
    end

    create_table :group_memberships do |t|
      t.references :member, polymorphic: true ###, index: true
      t.references :group, polymorphic: true ###, index: true

      # The named group to which a member belongs (if using)
      t.string     :group_name, limit: 40 ###, index: true

      # The membership type the member belongs with
      #t.string     :membership_type

      t.timestamps
    end
  end
end
