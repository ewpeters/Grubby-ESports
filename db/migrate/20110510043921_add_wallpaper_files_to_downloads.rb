class AddWallpaperFilesToDownloads < ActiveRecord::Migration
  def self.up
    change_table :downloads do |t|
      t.string   :wallpaper_one_label
      t.string   :wallpaper_one_file_name
      t.string   :wallpaper_one_content_type
      t.integer  :wallpaper_one_file_size
      t.datetime :wallpaper_one_updated_at
      
      t.string   :wallpaper_two_label
      t.string   :wallpaper_two_file_name
      t.string   :wallpaper_two_content_type
      t.integer  :wallpaper_two_file_size
      t.datetime :wallpaper_two_updated_at
      
      t.string   :wallpaper_three_label
      t.string   :wallpaper_three_file_name
      t.string   :wallpaper_three_content_type
      t.integer  :wallpaper_three_file_size
      t.datetime :wallpaper_three_updated_at
    end
  end

  def self.down
    remove_column :downloads, :wallpaper_one_label
    remove_column :downloads, :wallpaper_two_label
    remove_column :downloads, :wallpaper_three_label
    
    remove_column :downloads, :wallpaper_one_file_name
    remove_column :downloads, :wallpaper_one_content_type
    remove_column :downloads, :wallpaper_one_file_size
    remove_column :downloads, :wallpaper_one_updated_at
    
    remove_column :downloads, :wallpaper_two_file_name
    remove_column :downloads, :wallpaper_two_content_type
    remove_column :downloads, :wallpaper_two_file_size
    remove_column :downloads, :wallpaper_two_updated_at

    remove_column :downloads, :wallpaper_three_file_name
    remove_column :downloads, :wallpaper_three_content_type
    remove_column :downloads, :wallpaper_three_file_size
    remove_column :downloads, :wallpaper_three_updated_at
  end
end
