class HomeController < ApplicationController
  def index
    @news = Ticker.find(:all, :limit => 10, :order => 'position ASC')
  end
end