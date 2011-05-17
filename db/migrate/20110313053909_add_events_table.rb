class AddEventsTable < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string    :title, :null => false
      t.datetime  :email, :null => false
      t.string    :link,  :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
