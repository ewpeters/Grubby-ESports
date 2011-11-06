class Group < ActiveRecord::Base
  default_scope :order => "name ASC"
  belongs_to :owner, :class_name => "User"

  has_many :group_users
  has_many :users, :through => :group_users
  has_many :permissions

  validates_presence_of :name

  before_create :add_owner_to_users
  before_create :set_identifier

  def add_owner_to_users
    users << owner unless owner.nil?
  end

  def to_s
    name
  end

  def set_identifier
    self.identifier = name.downcase.gsub(' ', '_')
  end

  def ip_array
    users.collect{|u| u.ips.collect{|i| i.ip}}.flatten
  end

  def self.no_ban_ips
    Group.find_by_identifier("administrators").ip_array + Group.find_by_identifier("moderators").ip_array
  end

  def self.no_ban_ids
    Group.find_by_identifier("administrators").users.collect{|u| u.id} + Group.find_by_identifier("moderators").users.collect{|u| u.id}
  end
end
