if Rails.env == "production" 
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
     :address => 'localhost',
     :port => 25,
     :domain => "followgrubby.com",
  }
  ActionMailer::Base.perform_deliveries = true
  ActionMailer::Base.raise_delivery_errors = true
  ActionMailer::Base.default_charset = "utf-8"
end
