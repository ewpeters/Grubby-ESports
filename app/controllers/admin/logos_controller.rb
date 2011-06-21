class Admin::LogosController < Admin::ApplicationController
  before_filter :find_logo, :except => [:new, :create, :index]
  def new
    @logo = Logo.new
    respond_to do |format|
      format.html
    end  
  end
  def index
    @logos =  Logo.find(:all, :order => "position ASC")
  end

  def show
  end
  
  def edit
  end
  
  def destroy
    @logo.destroy
    flash[:notice] = t(:deleted, :thing => "Logo")
    redirect
  end
  
  def create
    @logo = Logo.new(params[:logo])
    respond_to do |format|
      if @logo.save
        format.html { redirect_to(admin_logos_path, :notice => 'Logo was successfully created.') }
        format.xml  { render :xml => @logo, :status => :created, :location => @logo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @logo.errors, :status => :unprocessable_entity }
      end
    end
  end
    
  def update
    respond_to do |format|
      if @logo.update_attributes(params[:logo])
        format.html { redirect_to(admin_logos_path, :notice => 'Logo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @logo.errors,
                    :status => :unprocessable_entity }
      end
    end
  end
  
  
  def move_up
    @logo.move_higher
    flash[:notice] = t(:moved_higher, :thing => "Logo")
    redirect
  end

  # Moves a forum one space down using an acts_as_list provided method.
  def move_down
    @logo.move_lower
    flash[:notice] = t(:moved_lower, :thing => "Logo")
    redirect
  end

  # Moves a forum to the top using an acts_as_list provided method.
  def move_to_top
    @logo.move_to_top
    flash[:notice] = t(:moved_to_top, :thing => "Logo")
    redirect
  end

  # Moves a forum to the bottom using an acts_as_list helper.
  def move_to_bottom
    @logo.move_to_bottom
    flash[:notice] = t(:moved_to_bottom, :thing => "logo")
    redirect
  end
  private

  def redirect
    redirect_to(admin_logos_path)
  end
  
  def find_logo
    @logo = Logo.find(params[:id]) unless params[:id].nil?
    rescue ActiveRecord::RecordNotFound
     not_found
  end
  
  def not_found
   flash[:notice] = t(:not_found, :thing => "Logo")
   redirect
  end
end