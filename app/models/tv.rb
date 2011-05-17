class Tv < ActiveRecord::Base
  validates_presence_of :title, :from, :summary, :embeded, :thumb_file_name, :display_date, :game, :video_type
  validates_presence_of :chat_code, :if => Proc.new { |dl| dl.video_type == "JustinTV" }
  GAMES = ["Starcraft 2", "Warcraft 3"]
  VIDEO_TYPE = ["Default", "You Tube", "JustinTV", "GOMTV", "BlipTV"]
  acts_as_taggable_on :tags
  has_attached_file :thumb, :styles => { :normal => "133x69!" }
end
