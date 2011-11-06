class Moderator::BannedUsersController < Moderator::ApplicationController
  def index
    @users = User.find(:all, :conditions => ["ban_times > 0"])
  end

  def un_ban
    @user = User.find_by_id(params[:id])
    if @user
      @user.ban_times = 0
      @user.banned_by = current_user
      @user.ban_time  = nil
      @user.ban_reason = nil
      @user.save
    end
    flash[:notice] = "User unbanned"
    redirect_to :controller => "moderator/banned_users", :action => :index
  end

  def ban
    if request.post?
      @user = User.find_by_id(params[:id])
      if @user
        @user.ban_times += 1
        @user.banned_by = current_user
        @user.ban_reason = params[:reason]
        @user.ban_time = Time.now
      end
      if @user.save
        flash[:notice] = "User banned"
        redirect_to :controller => "moderator/banned_users", :action => :index
      else
        render :action => "ban", :id => params[:id], :method => :get             
      end
    end
  end
end
