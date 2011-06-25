class Post < ActiveRecord::Base
  # default_scope :order => "posts.number ASC"
  
  acts_as_list :column => "number", :scope => :topic_id
  TIME_BETWEEN_POSTS = 3.second
  # For distance_of_time_in_words
  include ActionView::Helpers::DateHelper
  belongs_to :user
  belongs_to :ip
  belongs_to :topic
  belongs_to :edited_by, :class_name => "User"

  has_many :edits, :order => "created_at DESC", :dependent => :destroy
  has_many :moderations, :as => :moderated_object, :dependent => :destroy
  # has_many :attachments, :class_name => "PostAttachment"
  has_many :reports, :as => :reportable, :dependent => :destroy
  has_many :reporters, :through => :reports, :source => :user

  validates_length_of :text, :minimum => 4
  validates_presence_of :text

  # accepts_nested_attributes_for :attachments

  if SEARCHING
    define_index do
      indexes text
      set_property :delta => true
    end if Post.table_exists?
  end  
  delegate :subject, :to => :topic
  attr_protected :forum_id, :user_id

  after_create :log_ip
  before_create :stop_spam
  after_create :update_last_post
  after_destroy :update_last_post

  before_create :increment_counter
  before_destroy :decrement_counter

  def increment_counter
    forum.increment!(:posts_count)
  end

  def decrement_counter
    forum.decrement!(:posts_count)
  end

  def stop_spam
    if (!user.posts.last.nil? && user.posts.last.created_at > Time.now - TIME_BETWEEN_POSTS) && !user.can?(:ignore_flood_limit)
      errors[:base] << "You can only post once every #{distance_of_time_in_words(Time.now, Time.now - TIME_BETWEEN_POSTS)}"
      return false
    end
  end

  def log_ip
    IpUser.find_or_create_by_user_id_and_ip_id(user.id, ip.id)
  end

  # Finds the latest post and updates the forum accordingly.
  # Called after create and destroy of posts.
  def update_last_post
    topic.update_last_post
  end

  def editor
    edits.last.user
  end


  def belongs_to?(other_user)
    user == other_user
  end

  delegate :forum, :to => :topic

  def page_for(user)
    (topic.posts.count.to_f / (user.per_page || PER_PAGE)).ceil
  end

end
