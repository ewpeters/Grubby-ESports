class Admin::AlbumsController < Admin::ApplicationController
  before_filter :find_album, :except => [:new, :create, :index]
  def new
    @album = Album.new
    respond_to do |format|
      format.html
    end  
  end
  def index
    @albums =  Album.paginate(:order => "position ASC",:page => params[:page], :per_page => per_page)
  end

  def show
  end
  
  def edit
  end
  
  def destroy
    @album.destroy
    flash[:notice] = t(:deleted, :thing => "Album")
    redirect
  end
  
  def create
    @album = Album.new(params[:album])
    @album.tag_list = params[:tags]

    respond_to do |format|
      if @album.save
        format.html { redirect_to("/admin/albums/add_photos/#{@album.id}", :notice => 'Album was successfully created.') }
        format.xml  { render :xml => @album, :status => :created, :location => @album }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def add_photos
    
  end
  
  def uploader
    @photo = Photo.new
    @photo.picture = params[:file]
    @photo.album = @album
    @photo.save
    render :layout => false
  end
  
  def update
    @album = Album.find(params[:id])
    @album.tag_list = params[:tags]
    @album.save
    
    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to("/admin/albums/add_photos/#{@album.id}",
                    :notice => 'Album was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @album.errors,
                    :status => :unprocessable_entity }
      end
    end
  end
  
  def set_cover
    @album.cover = Photo.find(params[:photo_id])
    @album.save
    flash[:notice] = "Cover successfully set"
    redirect_to(admin_album_path(@album))
  end
  
  def move_up
    @album.move_higher
    flash[:notice] = t(:moved_higher, :thing => "Album")
    redirect
  end

  # Moves a forum one space down using an acts_as_list provided method.
  def move_down
    @album.move_lower
    flash[:notice] = t(:moved_lower, :thing => "Album")
    redirect
  end

  # Moves a forum to the top using an acts_as_list provided method.
  def move_to_top
    @album.move_to_top
    flash[:notice] = t(:moved_to_top, :thing => "Album")
    redirect
  end

  # Moves a forum to the bottom using an acts_as_list helper.
  def move_to_bottom
    @album.move_to_bottom
    flash[:notice] = t(:moved_to_bottom, :thing => "Album")
    redirect
  end
  private

  def redirect
    redirect_to(admin_albums_path)
  end
  
  def find_album
    @album = Album.find(params[:id]) unless params[:id].nil?
    rescue ActiveRecord::RecordNotFound
     not_found
  end
  
  def not_found
   flash[:notice] = t(:not_found, :thing => "Album")
   redirect
  end
end