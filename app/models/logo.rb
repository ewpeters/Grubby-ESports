require 'open-uri'
class Logo < ActiveRecord::Base
  validates_presence_of :picture_file_name
  acts_as_list
  default_scope :order => "position ASC"
  attr_accessor :image_url
  has_attached_file :picture, :styles => {:original => "110x120!"}
  before_validation :download_remote_image, :if => :image_url_provided?
  validates_presence_of :image_remote_url, :if => :image_url_provided?, :message => 'is invalid or inaccessible'

  private
    def image_url_provided?
      !self.image_url.blank?
    end

    def download_remote_image
      self.picture = do_download_remote_image
      self.image_remote_url = image_url
    end

    def do_download_remote_image
      io = open(URI.parse(image_url))
      def io.original_filename; base_uri.path.split('/').last; end
      io.original_filename.blank? ? nil : io
    rescue # catch url errors with validations instead of exceptions (Errno::ENOENT, OpenURI::HTTPError, etc...)
    end
end