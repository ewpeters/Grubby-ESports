class ApplicationController < ActionController::Base
  protect_from_forgery
  include AuthenticatedSystem
  include Rboard::Auth  
  before_filter :set_active_tab
    # Login in the user from a cookie session store.
  before_filter :login_from_cookie

  # Redirect to the banned page if the requesting IP is banned.
  before_filter :ip_banned_redirect

  # Mark the current user as active if they're logged in.
  before_filter :active_user

  # Sets the page value to be a proper one if something nonsense is specified.
  before_filter :check_page_value

  # Sets the timezone to be the timezone that the user's specified.
  before_filter :set_time_zone

  # Sets the default theme

  before_filter :get_events
  before_filter :get_logos
  before_filter :get_status
  before_filter :set_ads
  before_filter :get_features
  
  def check_page_value
    params[:page] = params[:page].to_i <= 0 ? "1" : params[:page]
  end

  def set_time_zone
    Time.zone = current_user.time_zone if logged_in? && !current_user.time_zone.nil?
  end
  
  def get_events
    @events = Event.find(:all, :order => "date ASC")
    @now = Time.now.utc
    todays_events = @events.select{|event| event.date.utc.strftime('%d%m') == @now.strftime('%d%m')}
    @next_three = []
    if todays_events.empty?
      @next_three = @events.select{|event| event.date.utc > @now}[0..2]
    end
  end
  
  def get_features
    @features = Feature.find(:all, :limit => 7, :order => 'position ASC')
  end
  
  def get_logos
    @logos = Logo.find(:all, :limit => 4)
  end
  
  def get_status
    @status = Status.first
  end
  
  def set_ads
    if Time.now.to_i % 2 == 0
      @banner_ad = "/ads/SteelSeries-7H_grubby_728x90.swf"
      @side_ad   = "/ads/SteelSeries-ikari_grubby_160x600.swf"
    else
      @banner_ad = "/ads/SteelSeries-ikari_grubby_728x90.swf"
      @side_ad   = "/ads/SteelSeries-7H_grubby_160x600.swf"
    end
      @side_ad = '/ads/steelseries-sensei-160x600.swf'
    c = GeoIP.new('GeoIP.dat').country(request.remote_ip)
    code = c.country_code3
    if code == "DEU"
@banner_ad = "/ads/GER-steelseries-sensei-728x90.swf"
elsif c.country_name.include?("Netherlands")	
@banner_ad = "/ads/NL-steelseries-sensei-728x90.swf	"
elsif code == "NOR"	
@banner_ad = "/ads/NOR-steelseries-sensei-728x90.swf	"
elsif code == "POL"	
@banner_ad = "/ads/POL-steelseries-sensei-728x90.swf"
elsif code == "SWE"	
@banner_ad = "/ads/SWE-steelseries-sensei-728x90.swf"
elsif code == "DNK" || c.country_name.include?("Denmark")
@banner_ad = "/ads/DK-steelseries-sensei-728x90.swf	"
elsif c.country_name.include?("United Kingdom")	
@banner_ad = "/ads/UK-steelseries-sensei-728x90.swf"
else
@banner_ad = "/ads/steelseries-sensei-728x90.swf"
end

  end
  protected
  # Borrowed from http://rpheath.com/posts/304-tabbed-nav … refactored
    def set_active_tab
      # will default to controller_name if @active_tab
      # has not been set by another controller
     @active_tab ||= self.controller_name.to_sym
    end
end
