class AddIconImageFields < ActiveRecord::Migration
  def self.up
    change_table :downloads do |t|
      t.string  :image_icon_file_file_name
      t.string  :image_icon_file_content_type
      t.integer :image_icon_file_file_size
    end
  end

  def self.down
    remove_column :downloads, :image_icon_file_file_name
    remove_column :downloads, :image_icon_file_content_type
    remove_column :downloads, :image_icon_file_file_size
  end
end
