class ShopItem < ActiveRecord::Base
  validates_presence_of :title, :price, :description, :shipping, :image_file_name
  has_attached_file :image
end
