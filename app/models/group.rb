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
end
