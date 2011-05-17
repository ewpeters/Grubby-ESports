class AddNewPermissions < ActiveRecord::Migration
  def self.up
    change_table :permissions do |t|
      t.boolean :can_manage_articles, :default => false
      t.boolean :can_manage_features, :default => false
      t.boolean :can_manage_events, :default => false
    end
  end

  def self.down
    remove_column :permisisons, :can_manage_articles
    remove_column :permissions, :can_manage_features
    remove_column :permissions, :can_manage_events
  end
end
