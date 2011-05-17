class DownloadsController < ApplicationController
  def index
    @features = Feature.find(:all, :limit => 5)
    @medias = []
    params[:game] ||= "all"
    params[:filter] ||= "featured"
    if params[:filter] == "search"
      search_condition = "%" + params[:query] + "%"
      @medias = Download.find(:all, :conditions => ['title LIKE ? OR summary LIKE ? OR player_one_name LIKE ? OR player_two_name LIKE ?', search_condition, search_condition, search_condition, search_condition])
    else
      @medias = params[:game] == "all" ? Download.tagged_with(params[:filter]).all : Download.tagged_with(params[:filter]).find_all_by_game(params[:game])
    end
  end
  
  def download
    @dl = Download.find(params[:id])
    @dl.downloaded = @dl.downloaded.to_i + 1
    @dl.save
    render :layout => false
  end
end
