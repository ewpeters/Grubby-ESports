class AlbumsController < ApplicationController
  before_filter :set_tag_filter
  def index
    @features = Feature.find(:all, :limit => 5)
    @albums = []
    if params[:filter] == "search"
      search_condition = "%" + params[:query] + "%"
      @albums = Album.find(:all, :conditions => ['title LIKE ? OR description LIKE ?', search_condition, search_condition])
    else
      @albums = Album.tagged_with(params[:filter]).all
    end
  end
  
  def show
    @album = Album.find(params[:id])
    respond_to do |format|
      format.js { render :json => {:html => render_to_string( :partial => 'album_pics') }} 
      format.html
    end
  end
  
  def slide
    @features = Feature.find(:all, :limit => 5)
    @album = Album.find(params[:id])
    @position = params[:position]
    respond_to do |format|
      format.js { render :json => {:html => render_to_string( :partial => 'slideshow') }} 
      format.html
    end
  end
  
  def slide_click
    
  end
  
  def set_tag_filter
    params[:game] ||= "all"
    params[:filter] ||= "featured"
  end
end
