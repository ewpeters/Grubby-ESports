if Rails.env == "production" 
  ActionMailer::Base.delivery_method = :smtp

  require "smtp_tls"

    ActionMailer::Base.smtp_settings = {
    :enable_starttls_auto => true,
    :address => "smtp.gmail.com",
    :port => 587,
    :authentication => :plain,
    :user_name => "admin@followgrubby.com",
    :password => "grubtor112"
    } 
  ActionMailer::Base.perform_deliveries = true
  ActionMailer::Base.raise_delivery_errors = true
  ActionMailer::Base.default_charset = "utf-8"
end
