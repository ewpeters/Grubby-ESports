class AddMediaPermissions < ActiveRecord::Migration
  def self.up
    change_table :permissions do |t|
      t.boolean :can_manage_media, :default => false
    end
  end

  def self.down
    remove_column :permisisons, :can_manage_media
  end
end
