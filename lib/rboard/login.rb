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
        Rails.logger.info(cookies[:auth_token])
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
      redirect_back_or_default('/')
    else
      @user = User.new
      if !params[:uid].blank? && !params[:access_token].blank?
        existing_user = User.authenticate(params[:user][:login], params[:user][:password])
        if existing_user
          @user = existing_user
          @user.uid = params[:uid]
        else
          @user = User.new(params[:user])
          @user.display_name = @user.login
          @user.uid = params[:uid]
        end
      else
        @user = User.new(params[:user])
        @user.display_name = @user.login
      end
      if request.post?
        if @user.save
          if @user.uid.blank?
            flash[:notice] = t(:thanks_for_signing_up)
          else
            self.current_user = @user
          end
          flash[:notice] = t(:thanks_for_signing_up)
          redirect_to(:controller => "home", :action => "index")
        else
          if params[:fb]
            render :action => "signup"
          else
            render :action => "signup"
          end
        end
      end
    end
  end
  
  def fb_login
    if params[:access_token] && params[:uid]
      self.current_user = @user = User.fb_authenticate(params[:uid], params[:access_token])
    end
    if logged_in?    
      flash[:notice] = t(:logged_in_successfully)
      redirect_back_or_default('/home') and return false
    else
      flash[:notice] = t(:username_or_password_incorrect)
      redirect_back_or_default('/home')
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