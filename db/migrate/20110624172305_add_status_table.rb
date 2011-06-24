class AddStatusTable < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
      t.text :message
      t.integer :position
      t.timestamps
    end
    
    change_table :permissions do |t|
      t.boolean :can_manage_status, :default => false
    end
  end

  def self.down
    drop_table :statuses
    remove_column :permissions, :can_manage_status
  end
end
