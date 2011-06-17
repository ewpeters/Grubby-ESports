class Admin::DownloadsController < Admin::ApplicationController
  before_filter :find_media, :except => [:new, :create, :index]
  def new
    @media = Download.new
    respond_to do |format|
      format.html
    end  
  end
  def index
    @featured =  Download.tagged_with("featured").paginate(:page => params[:page], :per_page => per_page)
    @archived =  Download.tagged_with("archived").paginate(:page => params[:page], :per_page => per_page)
    @other    =  Download.all - @featured - @archived
  end

  def show
  end
  
  def edit
  end
  
  def destroy
    @media.destroy
    flash[:notice] = t(:deleted, :thing => "Download Item")
    redirect
  end
  
  def create
    @media = Download.new(params[:download])
    @media.tag_list = params[:tags]
    if @media.save
      redirect_to(admin_downloads_path, :notice => 'Download Item was successfully created.')
    else
      render :action => "new" 
    end
  end
  def update
    @media.tag_list = params[:tags]
    @media.save
    respond_to do |format|
      if @media.update_attributes(params[:download])
        format.html { redirect_to(admin_downloads_path,
                    :notice => 'Download Item was successfully updated.') }
                    format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @media.errors,
                    :status => :unprocessable_entity }
      end
    end
  end
  private

  def redirect
    redirect_to(admin_downloads_path)
  end
  
  def find_media
    @media = Download.find(params[:id]) unless params[:id].nil?
    rescue ActiveRecord::RecordNotFound
     not_found
  end
  
  def not_found
   flash[:notice] = t(:not_found, :thing => "Download Item")
   redirect
  end
end