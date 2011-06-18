class ChangeDefaultAvatar < ActiveRecord::Migration
  def self.up
    change_column_default(:users, :avatar_file, "default.png")
  end

  def self.down
  end
end
