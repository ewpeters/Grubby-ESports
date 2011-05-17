class AddActivationAndMigrationToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.boolean :activated, :default => false, :null => false
      t.string :reset_code, :default => ""
      t.string :activation_code, :default => ""
    end
  end

  def self.down
  end
end
