class UserObserver < ActiveRecord::Observer
  def after_create(user)
    UserMailer.delay.deliver_signup_notification(user)
  end
  
  def after_save(user)
    if user.activated? && user.activation_code
      UserMailer.delay.deliver_activation(user) 
      user.activation_code = nil
      user.save
    end
    UserMailer.delay.deliver_reset_notification(user) if user.recently_reset?
  end
end
