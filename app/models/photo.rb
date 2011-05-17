require 'paperclip_processors/watermark'
class Photo < ActiveRecord::Base
  validates_presence_of :picture_file_name
  belongs_to :album
  acts_as_list :scope => :album_id
  has_attached_file :picture,
    :processors => [:watermark],
    :styles => {
        :thumb => { 
          :geometry => "144x102>", 
          :watermark_path => "#{Rails.root}/public/images/watermark_thm.png",
          :position => "SouthEast"
        },
        :normal => { 
          :geometry => "555x375>", 
          :watermark_path => "#{Rails.root}/public/images/watermark.png",
          :position => "SouthEast"
        }
      }
      
  after_save :verify_cover
  
  def verify_cover
    if !album.cover
      album.cover = album.photos.first
      album.save
    end
  end
end