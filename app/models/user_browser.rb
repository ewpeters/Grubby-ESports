class UserBrowser < ActiveRecord::Base
  belongs_to :browser
  belongs_to :user
end