# validates_presence_of :title, :article_type, :author, :html_file_name
class Ticker < ActiveRecord::Base
  validates_presence_of :title_small, :tagline_small, :title_list, :title, :picture_file_name, :summary
  has_one :article
  accepts_nested_attributes_for :article, :reject_if => :reject_articles
  acts_as_list
  has_attached_file :picture, :path => ":attachment/:id/:style/:basename.:extension"
    
  def reject_articles(attributed)
    attributed['title'].blank? || attributed['article_type'].blank? || attributed['author'].blank? || attributed['html_file_name'].blank?
  end
end