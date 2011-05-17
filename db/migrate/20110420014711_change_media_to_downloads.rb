class ChangeMediaToDownloads < ActiveRecord::Migration
  def self.up
    rename_column :permissions, :can_manage_media, :can_manage_downloads
    rename_table :medias, :downloads
  end

  def self.down
    rename_column :permissions, :can_manage_downloads, :can_manage_media
    rename_table :downloads, :medias
  end
end
