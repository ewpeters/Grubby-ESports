class Status < ActiveRecord::Base
  default_scope :order => "position"
  validates_presence_of :message
  acts_as_list
end