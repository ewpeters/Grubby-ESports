class Download < ActiveRecord::Base
  validates_presence_of :title, :summary, :display_date
  validates_presence_of :map_image_link
  validates_presence_of :icon_image_link, :unless => Proc.new{|user| user.image_icon_file_file_name }
  validates_presence_of :image_icon_file_file_name, :unless => Proc.new{|user| user.icon_image_link }
  validates_presence_of :url, :unless => Proc.new { |user| user.tag_list.member?("wallpaper") || user.media_file_file_name }
  validates_presence_of :media_file_file_name, :unless => Proc.new { |user| user.tag_list.member?("wallpaper") || user.url }
  validates_presence_of :wallpaper_one,   :if => Proc.new { |user| user.tag_list.member?("wallpaper") }
  validates_presence_of :wallpaper_two,   :if => Proc.new { |user| user.tag_list.member?("wallpaper") }
  validates_presence_of :wallpaper_three, :if => Proc.new { |user| user.tag_list.member?("wallpaper") }
  validates_presence_of :player_one_name, :unless => Proc.new { |user| user.tag_list.member?("wallpaper") }
  validates_presence_of :player_two_name, :unless => Proc.new { |user| user.tag_list.member?("wallpaper") }
  
  RACES = ["Terran", "Zerg", "Protoss", "Orc", "Night Elf", "Human", "Undead"]
  acts_as_taggable_on :tags
  has_attached_file :media_file
  has_attached_file :image_icon_file, :styles => { :icon => "67x55!" }
  has_attached_file :wallpaper_one, :styles => { :thumb => "210x135!" }
  has_attached_file :wallpaper_two, :styles => { :thumb => "210x135!" }
  has_attached_file :wallpaper_three, :styles => { :thumb => "210x135!" } 
end
