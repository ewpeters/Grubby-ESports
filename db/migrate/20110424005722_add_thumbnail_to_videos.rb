class AddThumbnailToVideos < ActiveRecord::Migration
  def self.up
    change_table :tvs do |t|
      t.string   :thumb_file_name
      t.string   :thumb_content_type
      t.integer  :thumb_file_size
      t.datetime :thumb_updated_at
    end
  end

  def self.down
    remove_column :tvs, :thumb_file_name
    remove_column :tvs, :thumb_content_type
    remove_column :tvs, :thumb_file_size
    remove_column :tvs, :thumb_updated_at
  end
end
