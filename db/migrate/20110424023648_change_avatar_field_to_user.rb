class ChangeAvatarFieldToUser < ActiveRecord::Migration
  def self.up
    remove_column :users, :avatar
    change_table :users do |t|
      t.string :avatar_file, :default => "default"
    end
  end

  def self.down
  end
end
