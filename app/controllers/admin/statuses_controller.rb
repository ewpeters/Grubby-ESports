class Admin::StatusesController < Admin::ApplicationController
  before_filter :find_status, :except => [:new, :create, :index]
  def new
    @status = Status.new
    respond_to do |format|
      format.html
    end  
  end
  def index
    @statuses = Status.all
  end

  def show
  end
  
  def edit
  end
  
  def destroy
    @status.destroy
    flash[:notice] = t(:deleted, :thing => "Status")
    redirect
  end
  
  def create
    @status = Status.new(params[:status])
      
    respond_to do |format|
      if @status.save
        format.html { redirect_to(admin_statuses_path, :notice => 'Status was successfully created.') }
        format.xml  { render :xml => @status, :status => :created, :location => @status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @status.errors, :status => :unprocessable_entity }
      end
    end
  end
  def update
    @status = Status.find(params[:id])
    respond_to do |format|
      if @status.update_attributes(params[:status])
        format.html { redirect_to(admin_statuses_path, :notice => 'Status was successfully created.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @status.errors,
                    :status => :unprocessable_entity }
      end
    end
  end
  
  def move_up
    @status.move_higher
    flash[:notice] = t(:moved_higher, :thing => "Status")
    redirect
  end

  # Moves a forum one space down using an acts_as_list provided method.
  def move_down
    @status.move_lower
    flash[:notice] = t(:moved_lower, :thing => "Status")
    redirect
  end

  # Moves a forum to the top using an acts_as_list provided method.
  def move_to_top
    @status.move_to_top
    flash[:notice] = t(:moved_to_top, :thing => "Status")
    redirect
  end

  # Moves a forum to the bottom using an acts_as_list helper.
  def move_to_bottom
    @status.move_to_bottom
    flash[:notice] = t(:moved_to_bottom, :thing => "Status")
    redirect
  end
  private

  def redirect
    redirect_to(admin_statuses_path)
  end
  
  def find_status
    @status = Status.find(params[:id]) unless params[:id].nil?
    rescue ActiveRecord::RecordNotFound
     not_found
  end
  
  def not_found
   flash[:notice] = t(:not_found, :thing => "Status")
   redirect
  end
  
end