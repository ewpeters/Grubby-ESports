class AddFbUidToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.text :uid
    end
  end

  def self.down
    remove_column :users, :uid
  end
end
