class AddUserAgentToUsers < ActiveRecord::Migration
  def self.up
    create_table :browsers do |t|
      t.text :agent
      t.timestamps
    end
      
    create_table :user_browsers do |t|
      t.references :user
      t.references :browser
    end
  end

  def self.down
    drop_table :user_browsers
    drop_table :browsers
  end
end
