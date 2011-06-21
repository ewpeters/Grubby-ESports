class CreateLogoModel < ActiveRecord::Migration
  def self.up
    create_table :logos do |t|
      t.string :picture_file_name
      t.string :picture_content_type
      t.string :image_remote_url
      t.integer :picture_file_size
      t.datetime :picture_updated_at
      t.integer :position
    end
    
    change_table :permissions do |t|
      t.boolean :can_manage_logos, :default => false
    end
  end

  def self.down
    drop_table :logos
  end
end
