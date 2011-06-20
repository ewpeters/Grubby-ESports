class AddShowTimeOptionToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.boolean :show_time, :default => true
    end
  end

  def self.down
    remove_column :events, :show_time
  end
end
