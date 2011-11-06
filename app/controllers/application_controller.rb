class ApplicationController < ActionController::Base
  protect_from_forgery
  include AuthenticatedSystem
  include Rboard::Auth
  before_filter :set_active_tab
    # Login in the user from a cookie session store.
  before_filter :login_from_cookie

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
    if true
      @host = "http://grubby.muppetshow.org/"
    else
      @host = ""
    end

    @banner_target = "http://www.steelseries.com/sensei?utm_source=grubby&utm_medium=topbanner&utm_campaign=sensei"
    @side_target   = "http://www.steelseries.com/sensei?utm_source=grubby&utm_medium=sidebanner&utm_campaign=sensei"
    @side_ad = '/ads/steelseries-sensei-160x600.swf'
    c = GeoIP.new('GeoIP.dat').country(request.remote_ip)
    code = c.country_code3
    if code == "DEU"
      @banner_ad = "/ads/GER-steelseries-sensei-728x90.swf"
      @banner_target = "http://www.alternate.de/html/product/SteelSeries/Sensei/893408"
    elsif c.country_name.include?("Netherlands")	
      @banner_ad = "/ads/NL-steelseries-sensei-728x90.swf	"
      @banner_target = "http://www.4launch.nl/shop/product/115480"
    elsif code == "NOR"	
      @banner_target = "http://www.komplett.no/k/ki.aspx?sku=648062"
      @banner_ad = "/ads/NOR-steelseries-sensei-728x90.swf	"
    elsif code == "POL"	
      @banner_target = "http://www.komputronik.pl/product/135316/Sprzet_komputerowy/Peryferia_i_eksploatacja/SteelSeries_Sensei.html"
      @banner_ad = "/ads/POL-steelseries-sensei-728x90.swf"
    elsif code == "SWE"	
      @banner_ad = "/ads/SWE-steelseries-sensei-728x90.swf"
      @banner_target = "http://www.maxfps.se/product_view.aspx?productid=4281"
    elsif code == "DNK" || c.country_name.include?("Denmark")
      @banner_target = "http://www.webdanes.dk/shop/steelseries-sensei-laser-2051p.html"
      @banner_ad = "/ads/DK-steelseries-sensei-728x90.swf	"
    elsif c.country_name.include?("United Kingdom")	
      @banner_target = "http://overclockers.co.uk/showproduct.php?prodid=KB-027-ST"
      @banner_ad = "/ads/UK-steelseries-sensei-728x90.swf"
    elsif code == "BEL"
      @banner_target = "http://www.gamegear.be/product_info.php?cPath=102&products_id=1850 "
      @banner_ad = "/ads/BEL-steelseries-sensei-728x90.swf"
    elsif code == "RUS"
      @banner_target = "http://www.es-gaming.ru/shop/UID_3158.html"
      @banner_ad = "/ads/RUS-steelseries-sensei-728x90.swf"
    elsif code == "UKR"
      @banner_target = "http://www.3ona51.com/ru/gaming-mouses/steelseries-sensei-laser-62150/index.html"
      @banner_ad = "/ads/UKR-steelseries-sensei-728x90.swf"
    elsif code == "ITA"
      @banner_target = "http://www.drako.it/drako_catalog/product_info.php?products_id=8576"
      @banner_ad = "/ads/IT-steelseries-sensei-728x90.swf"
    else
      @banner_ad = "/ads/steelseries-sensei-728x90.swf"
    end
    @banner_ad.insert(0, @host)
    @side_ad.insert(0, @host)
  end
  protected
  # Borrowed from http://rpheath.com/posts/304-tabbed-nav … refactored
    def set_active_tab
      # will default to controller_name if @active_tab
      # has not been set by another controller
     @active_tab ||= self.controller_name.to_sym
    end
end
