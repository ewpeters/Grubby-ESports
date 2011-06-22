class AddIconLinksToDownloadAndTv < ActiveRecord::Migration
  def self.up
    change_table :tvs do |t|
      t.string :icon_image_link
      t.string :thumbnail_image_link
    end
    change_table :downloads do |t|
      t.string :icon_image_link
    end
  end

  def self.down
  end
end
