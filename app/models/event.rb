class Event < ActiveRecord::Base
  validates_presence_of :title, :date, :link
  before_save :validate_link
  
  def validate_link
    if !self.link.match(/^http:\/\//)
      self.link = "http://#{self.link}"
    end
  end
end