class AddNewsTable < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title, :null => false
      t.text :summary, :null => false
      t.string :tag_line, :null => false
      t.string :picture_file_name
      t.string :picture_content_type
      t.integer :picture_file_size
      t.datetime :picture_updated_at
      t.string :html_file_name
      t.string :html_content_type
      t.integer :html_file_size
      t.datetime :html_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
