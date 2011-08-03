class Browser < ActiveRecord::Base
  has_many :user_browsers
  has_many :users, :through => :user_browsers
end