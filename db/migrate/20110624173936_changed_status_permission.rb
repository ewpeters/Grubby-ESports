class ChangedStatusPermission < ActiveRecord::Migration
  def self.up
    remove_column :permissions, :can_manage_status
    change_table :permissions do |t|
      t.boolean :can_manage_statuses, :default => false
    end
  end

  def self.down
    change_table :permissions do |t|
      t.boolean :can_manage_status, :default => false
    end
    remove_column :permissions, :can_manage_statuses
  end
end
