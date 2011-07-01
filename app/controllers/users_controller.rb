class UsersController < ApplicationController
  before_filter :store_location, :only => [:index]
  before_filter :login_required, :only => [:edit, :update, :index]
  
  skip_filter filter_chain, :only => [:deauth, :check]

  include Rboard::Login
  
  def index
    @users = User.paginate :page => params[:page], :per_page => 30, :order => "login ASC"
  end

  def show
    @user = User.find_by_permalink!(params[:id])
    @posts_percentage = Post.count > 0 ? @user.posts.count.to_f / Post.count.to_f * 100 : 0
    rescue ActiveRecord::RecordNotFound 
      flash[:notice] = t(:not_found, :thing => "user")
      redirect_to :controller => "home", :action => "index"
  end

  def edit
    @user = current_user
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
      if !params[:user][:display_name].blank?
        @user.name_change = 0
      end
      if @user.save
        redirect_to @user
      else
        flash[:notice] = t(:not_updated, :thing => "profile")
        render :action => "edit"
      end
    else
      flash[:notice] = t(:not_updated, :thing => "profile")
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
      redirect_to :controller => "home", :action => "index"
    end
  end
  
  def reset
    @user = User.find_by_reset_code(params[:reset_code]) unless params[:reset_code].nil?
    if request.post?
      if @user.update_attributes(:password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
        self.current_user = @user
        @user.delete_reset_code
        flash[:notice] = "Password reset successfully for #{@user.email}"
        redirect_to :controller => "home", :action => "index"
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
        redirect_to :controller => "home", :action => "index"
      else
        render :action => :activate
      end
    end
  end
  
  def send_email
    flash[:notice] = "Your email has been sent."
    UserMailer.delay.deliver_contact_email(params[:name], params[:email], params[:message])
    redirect_to :controller => "users", :action => "contact"
  end
  
  def jobs_email
    flash[:notice] = "Your email has been sent."
    UserMailer.delay.deliver_jobs_email(params[:name], params[:email], params[:message])
    redirect_to :controller => "users", :action => "jobs"
  end
  
  def contact
    
  end
  
  def jobs
    
  end
  
  def deauth
    if params[:signed_request]
      decode =  facebook_signed_request?(params[:signed_request])
      if decode
        user = User.find_by_uid(decode['user_id'])
        if user
          user.destroy
        end
      end
    end
    render :nothing => true
  end
  
  def check
    @success = false
    if params[:uid]
      @success = User.find_by_uid(params[:uid]) ? true : false
    end
  end
  
  private
  def facebook_signed_request?(signed_request)
      #decode data
      if signed_request.nil? 
        return false
      end
      encoded_sig, payload = signed_request.split('.')
      sig = str_to_hex(base64_url_decode(encoded_sig))
      data = ActiveSupport::JSON.decode base64_url_decode(payload)
  
      if data['algorithm'].to_s.upcase != 'HMAC-SHA256'
        Rails.logger.error 'Unknown algorithm. Expected HMAC-SHA256'
        return false
      end
  
      #check sig
      expected_sig = OpenSSL::HMAC.hexdigest('sha256', "f51da2f99537b91b19ed42d544d40efb", payload)
      if expected_sig != sig
          Rails.logger.error 'Bad Signed JSON signature!'
        return false
      end
    
      if !data.has_key?('user_id')
        return false
      end
    data
  end
  
  def process_code(code, try=1)
    require "net/https"
    require "uri"
    uri = URI.parse("https://graph.facebook.com")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    result = nil
    begin  
      response = http.get("/access_token?client_id=159271560800336&redirect_uri=http://followgrubby.com&client_secret=f51da2f99537b91b19ed42d544d40efb&code=#{code}")  
      result = JSON.parse(response.body)
    rescue
      if try == 4 
        result =  nil
      elsif response.nil? || response.code != "200"
        result = process_code(code, try + 1)
      end
    end
    result
  end
  
  def base64_url_decode str
      encoded_str = str.gsub('-','+').gsub('_','/')
      encoded_str += '=' while !(encoded_str.size % 4).zero?
      Base64.decode64(encoded_str)
  end
    
  def str_to_hex s
      (0..(s.size-1)).to_a.map do |i|
        number = s[i].to_s(16)
        (s[i] < 16) ? ('0' + number) : number
      end.join
  end
end
