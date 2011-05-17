class Album < ActiveRecord::Base
  validates_presence_of :title, :description
  acts_as_list
  acts_as_taggable_on :tags
  has_many :photos, :order => "position"
  has_one :cover, :class_name => "Photo", :foreign_key => "cover_id"
  
  after_create :set_cover
  
  def set_cover
    if !cover
      cover = photos.first
    end
  end
end