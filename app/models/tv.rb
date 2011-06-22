class Tv < ActiveRecord::Base
  validates_presence_of :title, :from, :summary, :embeded, :thumb_file_name, :display_date, :game, :video_type
  validates_presence_of :chat_code, :if => Proc.new { |dl| dl.video_type == "JustinTV" }
  GAMES = ["Starcraft 2", "Warcraft 3"]
  VIDEO_TYPE = ["Default", "You Tube", "JustinTV", "GOMTV", "BlipTV"]
  acts_as_taggable_on :tags
  default_scope :order => "created_at DESC"
  
  attr_accessor :image_url
  has_attached_file :thumb, :styles => { :normal => "133x69!" }
  before_validation :download_remote_image, :if => :image_url_provided?
  validates_presence_of :image_remote_url, :if => :image_url_provided?, :message => 'is invalid or inaccessible'
  private
    def image_url_provided?
      !self.image_url.blank?
    end

    def download_remote_image
      self.thumb = do_download_remote_image
      self.image_remote_url = image_url
    end

    def do_download_remote_image
      io = open(URI.parse(image_url))
      def io.original_filename; base_uri.path.split('/').last; end
      io.original_filename.blank? ? nil : io
    rescue # catch url errors with validations instead of exceptions (Errno::ENOENT, OpenURI::HTTPError, etc...)
    end  
end
