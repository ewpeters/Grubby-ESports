class AddShopItemsTable < ActiveRecord::Migration
  def self.up
    create_table :shop_items do |t|
      t.float :price
      t.float :shipping
      t.string :title
      t.text   :description
      t.integer :position
      t.string   :picture_file_name
      t.string   :picture_content_type
      t.integer  :picture_file_size
      t.datetime :picture_updated_at
    end
    
  end

  def self.down
    drop_table :shop_items
  end
end
