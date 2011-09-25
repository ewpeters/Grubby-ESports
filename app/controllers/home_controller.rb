class HomeController < ApplicationController
  def index
    # @news = Ticker.find(:all, :limit => 10, :order => 'position ASC')
    @live = Live.check_stream
  end
end
