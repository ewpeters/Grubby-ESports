class TvsController < ApplicationController
  def index
    params[:game] ||= ""
    params[:filter] ||= "featured"
    @live = Tv.tagged_with("special_live").first
    if params[:filter] == "search"
      search_condition = "%" + params[:query] + "%"
      @tvs = Tv.find(:all, :conditions => ["title LIKE ? OR summary LIKE ? OR 'from' LIKE ?", search_condition, search_condition, search_condition])
    else
      @tvs = Tv.tagged_with([params[:filter], params[:game]], :any => true)
    end
  end
  
  def show
    @tv = Tv.find(params[:id])
    render :layout => false
  end
  
  def watch
    @tv = Tv.find(params[:id])
    @tv.downloaded = @tv.downloaded.to_i + 1
    @tv.save
    render :layout => false
  end
end
