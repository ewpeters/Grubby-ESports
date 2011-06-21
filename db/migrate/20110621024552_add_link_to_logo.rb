class AddLinkToLogo < ActiveRecord::Migration
  def self.up
    change_table :logos do |t|
      t.string :link
    end
  end

  def self.down
  end
end
