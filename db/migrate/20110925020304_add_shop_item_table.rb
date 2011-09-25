class AddShopItemTable < ActiveRecord::Migration
  def self.up
    create_table :shop_items do |t|
      t.string   :title
      t.text     :description
      t.float    :price
      t.float    :shipping
      t.string   :image_file_name
      t.string   :image_content_type
      t.integer  :image_file_size
      t.datetime :image_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :shop_items
  end
end
