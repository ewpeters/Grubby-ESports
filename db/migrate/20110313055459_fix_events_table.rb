class FixEventsTable < ActiveRecord::Migration
  def self.up
    rename_column :events, :email, :date
  end

  def self.down
    rename_column :events, :date, :email
  end
end
