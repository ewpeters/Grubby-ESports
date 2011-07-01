class AddOneTimeUserNameChangeToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.integer :name_change, :default => 0
    end
  end

  def self.down
    remove_column :users, :name_change
  end
end
