class DownloadsController < ApplicationController
  def index
    @features = Feature.find(:all, :limit => 5)
    @medias = []
    params[:game] ||= ""
    params[:filter] ||= "featured"
    if params[:filter] == "search"
      search_condition = "%" + params[:query] + "%"
      @medias = Download.find(:all, :conditions => ['title LIKE ? OR summary LIKE ? OR player_one_name LIKE ? OR player_two_name LIKE ?', search_condition, search_condition, search_condition, search_condition])
      
      if params[:query].last == "s"
        params[:query] = params[:query][0..(params[:query].size - 2)]
      end
      @tag_search = Download.tagged_with(params[:query], :any => true)
      @medias = (@tag_search + @medias).uniq
    else
      @medias = Download.tagged_with([params[:filter], params[:game]], :any => true)
    end
  end
  
  def download
    @dl = Download.find(params[:id])
    @dl.downloaded = @dl.downloaded.to_i + 1
    @dl.save
    render :layout => false
  end
end
