class ChangeTvPermissions < ActiveRecord::Migration
  def self.up
    remove_column :permissions, :can_manage_tv
    change_table :permissions do |t|
      t.boolean :can_manage_tvs, :default => false
    end
  end

  def self.down
    remove_column :permissions, :can_manage_tvs
  end
end
