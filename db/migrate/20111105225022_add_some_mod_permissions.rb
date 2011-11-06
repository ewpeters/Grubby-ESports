class AddSomeModPermissions < ActiveRecord::Migration
  def self.up
    change_table :permissions do |t|
      t.boolean :can_manage_banned_users, :default => false
      t.boolean :can_manage_banned_ips, :defaul => false
    end
  end

  def self.down
    remove_column :permissions, :can_manage_banned_users
    remove_column :permissions, :can_manage_banned_ips
  end
end

