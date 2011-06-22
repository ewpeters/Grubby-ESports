class Tv < ActiveRecord::Base
  validates_presence_of :title, :from, :summary, :embeded, :display_date, :video_type
  validates_presence_of :chat_code, :if => Proc.new { |dl| dl.video_type == "JustinTV" }
  
  validates_presence_of :thumbnail_image_link, :unless => Proc.new { |user| user.thumb_file_name }
  validates_presence_of :thumb_file_name,      :unless => Proc.new { |user| user.thumbnail_image_link }
  VIDEO_TYPE = ["Default", "You Tube", "JustinTV", "GOMTV", "BlipTV"]
  acts_as_taggable_on :tags
  default_scope :order => "created_at DESC"

  has_attached_file :thumb, :styles => { :normal => "133x69!" }
end
