class UserObserver < ActiveRecord::Observer
  def after_create(user)
    if user.uid.blank?
      UserMailer.delay.deliver_signup_notification(user)
    end
  end
  
  def after_save(user)
    if user.activated? && user.activation_code && user.uid.blank?
      UserMailer.delay.deliver_activation(user) 
      user.activation_code = nil
      user.save
    end
    UserMailer.delay.deliver_reset_notification(user) if user.recently_reset?
  end
end
