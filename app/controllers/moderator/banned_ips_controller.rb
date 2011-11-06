class Moderator::BannedIpsController < Moderator::ApplicationController
  def index
    @ips = BannedIp.all
  end

  def un_ban
    @ip = BannedIp.find_by_id(params[:id]).destroy
    if @ip
      @ip.destroy
      flash[:notice] = t(:deleted, :thing => "Banned Ip")
    else
      flash[:notice] = "IP not found, oops \0.0/"
    end
    redirect_to :action => :index
  end

  def ban
    if request.post?
      @ip = BannedIp.new({
        :ip => params[:ip],
        :reason => params[:reason],
        :banned_by => current_user.id,
        :ban_time  => Time.now      
      })
      if @ip.save
        redirect_to :controller => "moderator/banned_users", :action => :index
      else
        render :action => "ban", :ip => params[:ip], :method => :get
      end
    else
      if BannedIp.find_by_ip(params[:ip])
        flash[:notice] = "Ip Already Banned"
        redirect(:back)
      end     
    end
  end
end
