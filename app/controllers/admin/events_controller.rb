class Admin::EventsController < Admin::ApplicationController
  def new
    @event = Event.new
    respond_to do |format|
      format.html
    end  
  end
  def index
    @events =  Event.paginate(:page => params[:page], :per_page => per_page)
  end
  def show
    @event = Event.find(params[:id])
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  def create
    @event = Event.new(params[:event])
    respond_to do |format|
      if @event.save
        format.html { redirect_to(admin_events_path, :notice => 'Event was successfully created.') }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @event = Event.find(params[:id]).destroy
    flash[:notice] = t(:deleted, :thing => "Event")
    redirect_to(admin_events_path)
  end
  
  def update
    @event = Event.find(params[:id])
 
    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(admin_events_path,
                    :notice => 'Event was successfully updated.') }
                    format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors,
                    :status => :unprocessable_entity }
      end
    end
  end
end
