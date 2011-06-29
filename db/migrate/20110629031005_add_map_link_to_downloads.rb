class AddMapLinkToDownloads < ActiveRecord::Migration
  def self.up
    change_table :downloads do |t|
      t.string :map_image_link
    end
  end

  def self.down
    remove_column :downloads, :map_image_link
  end
end
