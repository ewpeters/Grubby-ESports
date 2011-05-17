class AddPhotosPermissions < ActiveRecord::Migration
  def self.up
    change_table :permissions do |t|
      t.boolean :can_manage_photos, :default => false
    end
  end

  def self.down
    remove_column :permissions, :can_manage_photos
  end
end
