class HomeController < ApplicationController
  def index
    @news = Ticker.find(:all, :order => 'position DESC')
    @features = Feature.find(:all, :limit => 5)
  end
end