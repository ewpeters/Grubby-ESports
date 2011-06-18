if Rails.env == "production" 
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
     :address => "mail.followgrubby.com",
     :port => 2626,
     :authentication => :login,
     :domain => "followgrubby.com",
     :user_name => "admin+followgrubby.com",
     :password => "grubtor112"
  }
  ActionMailer::Base.perform_deliveries = true
  ActionMailer::Base.raise_delivery_errors = true
  ActionMailer::Base.default_charset = "utf-8"
end