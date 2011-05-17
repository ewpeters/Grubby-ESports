class UsersController < ApplicationController
  before_filter :store_location, :only => [:index]
  before_filter :login_required, :only => [:edit, :update, :index]
  
  include Rboard::Login
  skip_before_filter :lock_that_shit_up, :only => :login
  def index
    @users = User.paginate :page => params[:page], :per_page => 30, :order => "login ASC"
  end

  def show
    @user = User.find_by_permalink!(params[:id])
    @posts_percentage = Post.count > 0 ? @user.posts.count.to_f / Post.count.to_f * 100 : 0
    rescue ActiveRecord::RecordNotFound 
      flash[:notice] = t(:not_found, :thing => "user")
      redirect_back_or_default(users_path)
  end

  def edit
    @themes = Theme.all
  end

  def update
    if !params[:user][:password].blank? &&
       params[:user][:password] == params[:user][:password_confirmation]
      params[:user][:crypted_password] = current_user.encrypt(params[:user][:password])
      flash[:notice] = t(:password_has_been_changed)
    end
    
    @user = User.find_by_permalink!(params[:id]) 
    if @user.update_attributes(params[:user])
      flash[:notice] = t(:updated, :thing => "profile")
      redirect_to @user
    else
      flash.now[:notice] = t(:not_updated, :thing => "profile")
      render :action => "edit"
    end 
  end


  def ip_is_banned
    unless ip_banned?
      flash[:notice] = t(:ip_is_banned)
    end
    redirect_to forums_path
  end
  
  def forgot
    if request.post?
      user = User.find_by_email(params[:user][:email])
      if user
        user.create_reset_code
        flash[:notice] = "Reset code sent to #{user.email}"
      else
        flash[:notice] = "#{params[:user][:email]} does not exist in system"
      end
      redirect_back_or_default('/')
    end
  end
  
  def reset
    @user = User.find_by_reset_code(params[:reset_code]) unless params[:reset_code].nil?
    if request.post?
      if @user.update_attributes(:password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
        self.current_user = @user
        @user.delete_reset_code
        flash[:notice] = "Password reset successfully for #{@user.email}"
        redirect_back_or_default('/')
      else
        render :action => :reset
      end
    end
  end
  
  def activate
    @user = User.find_by_activation_code(params[:activation_code])
    if request.post?
      if @user.update_attributes(:activated => true)
        self.current_user = @user
        flash[:notice] = "Account activated!"
        redirect_back_or_default('/')
      else
        render :action => :activate
      end
    end
  end
  
  def send_email
    @user = current_user
    flash[:notice] = "Your email has been sent."
    UserMailer.contact_email(params[:name], params[:email], params[:message])
    redirect_back_or_default('/')
  end
  
  def contact
    
  end
end
