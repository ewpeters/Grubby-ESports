class AddAlbumAndPhoto < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.string :title
      t.text   :description
      t.timestamps
    end
    
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.integer :album_id
      t.timestamps
      t.string   :picture_file_name
      t.string   :picture_content_type
      t.integer  :picture_file_size
      t.datetime :picture_updated_at
    end
    
    change_table :permissions do |t|
      t.boolean :can_manage_albums, :default => false
    end
    
  end

  def self.down
    drop_table :albums
    drop_table :photos
    remove_column :permissions, :can_manage_albums
  end
end
