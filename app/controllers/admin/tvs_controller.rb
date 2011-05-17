class Admin::TvsController < Admin::ApplicationController
  before_filter :find_tv, :except => [:new, :create, :index]
  def new
    @tv = Tv.new
    respond_to do |format|
      format.html
    end  
  end
  def index
    @tvs =  Tv.paginate(:page => params[:page], :per_page => per_page)
  end

  def show
  end
  
  def edit
  end
  
  def destroy
    @tv.destroy
    flash[:notice] = t(:deleted, :thing => "TV Item")
    redirect
  end
  
  def create
    @tv = Tv.new(params[:tv])
    @tv.tag_list = params[:tags]
    if @tv.save
      redirect_to(admin_tvs_path, :notice => 'TV Item was successfully created.')
    else
      render :action => "new" 
    end
  end
  def update
    @tv.tag_list = params[:tags]
    @tv.save
    respond_to do |format|
      if @tv.update_attributes(params[:tv])
        format.html { redirect_to(admin_tvs_path,
                    :notice => 'tv Item was successfully updated.') }
                    format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tv.errors,
                    :status => :unprocessable_entity }
      end
    end
  end
  private

  def redirect
    redirect_to(admin_tv_path)
  end
  
  def find_tv
    @tv = Tv.find(params[:id]) unless params[:id].nil?
    rescue ActiveRecord::RecordNotFound
     not_found
  end
  
  def not_found
   flash[:notice] = t(:not_found, :thing => "tv Item")
   redirect
  end
end