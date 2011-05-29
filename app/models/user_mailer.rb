class UserMailer < ActionMailer::Base
  def self.signup_notification(user)
    setup_email(user)
    @subject    += 'Please activate your new account'  
    @url  = "http://50.16.224.93/activate/#{user.activation_code}".html_safe
    mail(:to => @recipients , :subject => @subject)
  end
  
  def self.activation(user)
    setup_email(user)
    @subject    += 'Your account has been activated!'
    @url  = "www.followgrubby.com"
    mail(:to => @recipients , :subject => @subject)
  end
  
  def self.reset_notification(user)
    setup_email(user)
    @subject    += 'Link to reset your password'
    @url  = "http://50.16.224.93/reset/#{user.reset_code}".html_safe
    mail(:to => @recipients , :subject => @subject)
  end
  
  def self.contact_email(name, email, message)
    @recipients = "admin@followgrubby.com"
    @from = "admin@followgrubby.com"
    @subject     = "Message from #{name}"
    @sent_on     = Time.now
    @name = name
    @email = email
    @message = message
    mail(:to => @recipients , :subject => @subject)
  end
  
  def self.jobs_email(name, email, message)
    @recipients = "admin@followgrubby.com"
    @from =       "admin@followgrubby.com"
    @subject     = "#{name} wants a job"
    @sent_on     = Time.now
    @name = name
    @email = email
    @message = message
    mail(:to => @recipients , :subject => @subject)
  end
  
  protected
    def self.setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "admin@followgrubby.com"
      @subject     = "[FollowGrubby] "
      @sent_on     = Time.now
      @user = user
    end
end