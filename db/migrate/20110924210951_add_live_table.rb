class AddLiveTable < ActiveRecord::Migration
  def self.up
    create_table :lives do |t|
      t.boolean :live, :default => false
    end
  end

  def self.down
    drop_tabl :lives
  end
end
