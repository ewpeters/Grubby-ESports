class AddShopPermission < ActiveRecord::Migration
  def self.up
    change_table :permissions do |t|
      t.boolean :can_manage_shop_items, :default => false
    end
  end

  def self.down
    drop_column :permissions, :can_manage_shop_items
  end
end
