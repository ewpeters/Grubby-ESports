module Rboard::Login
  def login
    if request.get? && logged_in?
      flash[:notice] = t(:already_logged_in)
      redirect_back_or_default('/home') and return false
    end
    return unless request.post?
    self.current_user = @user = User.authenticate(params[:login], params[:password])
    if logged_in?
      # #remember_me calls save internally, so don't bother saving it twice
      if params[:remember_me] == "1"
        self.current_user.remember_me
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
        # session[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
        # Rails.logger.info(session[:auth_token])
      else
        current_user.save
      end
      flash[:notice] = t(:logged_in_successfully)
      redirect_to('/home') and return false
    else
      # flash[:notice] = t(:username_or_password_incorrect)
      flash[:notice] = "Username or password incorrect. <a href='/forgot'>Reset Password</a>".html_safe
      redirect_to('/home')
    end
  end

  def signup
    if logged_in?
      flash[:notice] = t(:already_logged_in)
      redirect_back_or_default(forums_path)
    end
    @user = User.new(params[:user])
    return unless request.post?
    @user.save!
    redirect_back_or_default(forums_path)
    flash[:notice] = "Account created. An activation email will arrive soon."
  rescue ActiveRecord::RecordNotSaved, ActiveRecord::RecordInvalid
    flash[:notice] = t(:problem_during_signup)
  end
  
  def fb_signup
    if params[:access_token] && params[:uid]
      @user = User.new_fb_user(params[:uid], params[:access_token])
    else
      flash[:notice] = "Couldn't authenicate Facebook account."
      redirect_to(:back)
    end
    
    if @user.save
      self.current_user = @user
      self.current_user.remember_me
      cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      flash[:notice] = t(:thanks_for_signing_up)
    else
      flash[:notice] = "There was a problem making your Facebook account"
    end
    redirect_to(:back)
  end
  
  def fb_login
    if params[:access_token] && params[:uid]
      self.current_user = @user = User.fb_authenticate(params[:uid], params[:access_token])
      self.current_user.remember_me
      cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
    end
    if logged_in?    
      flash[:notice] = t(:logged_in_successfully)
      redirect_to(:back) and return false
    else
      flash[:notice] = "Couldn't authenicate Facebook account."
      redirect_to(:back)
    end
  end

  def logout
    redirect_to('login') and return false unless logged_in?
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    session[:user] = nil
    flash[:notice] = t(:you_have_been_logged_out)
    redirect_to('/home')
  end
end