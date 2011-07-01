class Event < ActiveRecord::Base
  validates_presence_of :title, :date
  before_save :validate_link
  
  default_scope :order => "date ASC"
  def validate_link
    if self.link
      if !self.link.match(/^http:\/\//)
        self.link = "http://#{self.link}"
      end
    end
  end
end