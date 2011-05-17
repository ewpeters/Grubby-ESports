class Admin::PhotosController < Admin::ApplicationController
  before_filter :find_photo, :except => [:new, :create, :index]

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(params[:photo])
    @photo.albums = Album.find(params[:album_id])
    respond_to do |format|
      if @photo.save
        format.html { redirect_to(admin_album_path(@photo.album), :notice => 'Photo was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def edit
    
  end

  def update
    if @photo.update_attributes(params[:photo])
      flash[:notice] = t(:updated, :thing => "photo")
      redirect
    else
      flash[:notice] = t(:not_updated, :thing => "photo")
      redirect
    end
  end

  def destroy
    @photo.destroy
    flash[:notice] = t(:deleted, :thing => "photo")
    redirect
  end

  def move_up
    @photo.move_higher
    flash[:notice] = t(:moved_higher, :thing => "photo")
    redirect
  end


  def move_down
    @photo.move_lower
    flash[:notice] = t(:moved_lower, :thing => "photo")
    redirect
  end

  def move_to_top
    @photo.move_to_top
    flash[:notice] = t(:moved_to_top, :thing => "Photo")
    redirect
  end

  def move_to_bottom
    @photo.move_to_bottom
    flash[:notice] = t(:moved_to_bottom, :thing => "Photo")
    redirect
  end
 
  private
  def redirect
    redirect_to(admin_album_path(@photo.album))
  end

  def find_photo
    @photo = Photo.find(params[:id]) unless params[:id].nil?
    rescue ActiveRecord::RecordNotFound
      not_found
  end

  def not_found
    flash[:notice] = t(:not_found, :thing => "Photo")
    redirect_to(admin_albums_path)
  end
end