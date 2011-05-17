class AddAvatarFieldToUser < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :avatar
    end
  end

  def self.down
  end
end
