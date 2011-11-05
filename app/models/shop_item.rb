class ShopItem < ActiveRecord::Base
  default_scope :order => "position"
  acts_as_list

  has_attached_file :picture, :styles => { :thumb => ["128x128#", :png] }
end
