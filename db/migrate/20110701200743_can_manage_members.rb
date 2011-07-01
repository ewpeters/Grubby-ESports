class CanManageMembers < ActiveRecord::Migration
  def self.up
    change_table :permissions do |t|
      t.boolean :can_manage_members, :default => false
    end
  end

  def self.down
    remove_column :permissions, :can_manage_members
  end
end
