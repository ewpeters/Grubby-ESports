require 'paperclip_processors/word'
class Article < ActiveRecord::Base
  validates_presence_of :title, :article_type, :author, :html_file_name
  belongs_to :ticker
  belongs_to :feature
  has_one :topic
  after_create :create_topic
  has_attached_file :html,
    :processors => [:word],
    :styles => {:original => ""},
    :path => ":attachment/:id/:style/:basename.:extension"
  def create_topic
    f = Forum.find_by_title("Article Discussion")
    u = User.first
    ip = Ip.find_or_create_by_ip(:ip => u.ip)
    t = Topic.create(:subject => "#{self.title} Discussion", :user => u, :ip =>ip)
    self.topic = t
    t.save
    f.topics << t
    f.save
    self.save
  end
end
