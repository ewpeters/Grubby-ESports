class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Please activate your new account'  
    @url  = "http://50.16.224.93/activate/#{user.activation_code}".html_safe
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'Your account has been activated!'
    @url  = "www.followgrubby.com"
  end
  
  def reset_notification(user)
    setup_email(user)
    @subject    += 'Link to reset your password'
    @url  = "http://50.16.224.93/reset/#{user.reset_code}".html_safe
  end
  
  def contact_email(name, email, message)
    @recipients = "admin@followgrubby.com"
    @from = "admin@followgrubby.com"
    @subject     = "Message from #{name}"
    @sent_on     = Time.now
    @name = name
    @email = email
    @message = message
  end
  
  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "admin@followgrubby.com"
      @subject     = "[FollowGrubby] "
      @sent_on     = Time.now
      @user = user
    end
end