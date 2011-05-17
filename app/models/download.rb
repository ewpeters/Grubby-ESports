class Download < ActiveRecord::Base
  validates_presence_of :title, :summary, :display_date
  validates_presence_of :media_file_file_name, :unless => Proc.new { |user| user.tag_list.member?("wallpaper") }
  validates_presence_of :wallpaper_one,   :if => Proc.new { |user| user.tag_list.member?("wallpaper") }
  validates_presence_of :wallpaper_two,   :if => Proc.new { |user| user.tag_list.member?("wallpaper") }
  validates_presence_of :wallpaper_three, :if => Proc.new { |user| user.tag_list.member?("wallpaper") }
  validates_presence_of :player_one_name, :unless => Proc.new { |user| user.tag_list.member?("wallpaper") }
  validates_presence_of :player_two_name, :unless => Proc.new { |user| user.tag_list.member?("wallpaper") }
  RACES = ["Terran", "Zerg", "Protoss", "Orc", "Night Elf", "Human", "Undead"]
  GAMES = ["Starcraft 2", "Warcraft 3"]
  acts_as_taggable_on :tags
  has_attached_file :media_file,
    :storage => :s3,
    :path => ":attachment/:id/:style/:basename.:extension"
  has_attached_file :wallpaper_one,
    :styles => { :thumb => "210x135!" },
    :path => ":attachment/:id/:style/:basename.:extension"
  has_attached_file :wallpaper_two,
    :styles => { :thumb => "210x135!" },
    :path => ":attachment/:id/:style/:basename.:extension"
  has_attached_file :wallpaper_three,
    :styles => { :thumb => "210x135!" },
    :path => ":attachment/:id/:style/:basename.:extension"
end
