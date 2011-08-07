class AddStaffForumPermissions < ActiveRecord::Migration
  def self.up
    change_table :permissions do |t|
      t.boolean :can_see_staff_forums, :default => false
    end
  end

  def self.down
    remove_column :permissions, :can_see_staff_forums
  end
end
