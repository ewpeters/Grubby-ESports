class ArchivesController < ApplicationController
  def index
    @tickers = Ticker.find(:all, :order => "position ASC", :conditions => "position > 10")
  end
end