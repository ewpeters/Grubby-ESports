class AddUrlToDownloads < ActiveRecord::Migration
  def self.up
    change_table :downloads do |t|
      t.text :url
    end
  end

  def self.down
    remove_column :downloads, :url
  end
end
