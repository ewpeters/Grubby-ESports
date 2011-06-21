class AddIconLinkToDownloads < ActiveRecord::Migration
  def self.up
    change_table :downloads do |t|
      t.string :icon_link
    end
  end

  def self.down
  end
end
