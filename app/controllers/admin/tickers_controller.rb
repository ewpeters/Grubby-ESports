class Admin::TickersController < Admin::ApplicationController
  before_filter :find_ticker, :except => [:new, :create, :index]
  def new
    @ticker = Ticker.new
    @article = @ticker.build_article
    respond_to do |format|
      format.html
    end  
  end

  def index
     @tickers = Ticker.paginate(:order => "position ASC", :page => params[:page], :per_page => per_page)
  end

  def show
    @ticker = Ticker.find(params[:id])
  end
  
  def edit
    @ticker = Ticker.find(params[:id])
  end
  
  def destroy
    @ticker.destroy
    flash[:notice] = t(:deleted, :thing => "ticker")
    redirect
  end

  def create
    @ticker = Ticker.new(params[:ticker])
      respond_to do |format|
      if @ticker.save
        format.html do 
          if @ticker.article
            path = "/admin/tickers/add_files/#{@ticker.id}"
          else
            path = admin_tickers_path
          end
          redirect_to(path, :notice => 'Ticker was successfully created.') 
        end
        format.xml  { render :xml => @ticker, :status => :created, :location => @ticker }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ticker.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @ticker = Ticker.find(params[:id])

    respond_to do |format|
      if @ticker.update_attributes(params[:ticker])
        format.html do 
          if @ticker.article
            path = "/admin/tickers/add_files/#{@ticker.id}"
          else
            path = admin_tickers_path
          end
          redirect_to(path, :notice => 'Ticker was successfully created.') 
        end
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ticker.errors,
                      :status => :unprocessable_entity }
      end
    end
  end
  
  def add_files
    
  end
  
  def uploader
    folder_name = "#{@ticker.article.html.original_filename.gsub(/\..*/, '')}"
    
    
    unless File.exists?("public/html_files/#{folder_name}")
      Dir.mkdir("public/html_files/#{folder_name}")
    end
    
    FileUtils.mv(params[:file].path, "public/html_files/#{folder_name}/#{params[:qqfile]}")  
    render :layout => false  
  end
  
  def move_up
    @ticker.move_higher
    flash[:notice] = t(:moved_higher, :thing => "Ticker")
    redirect
  end

  # Moves a forum one space down using an acts_as_list provided method.
  def move_down
    @ticker.move_lower
    flash[:notice] = t(:moved_lower, :thing => "Ticker")
    redirect
  end

  # Moves a forum to the top using an acts_as_list provided method.
  def move_to_top
    @ticker.move_to_top
    flash[:notice] = t(:moved_to_top, :thing => "Ticker")
    redirect
  end

  # Moves a forum to the bottom using an acts_as_list helper.
  def move_to_bottom
    @ticker.move_to_bottom
    flash[:notice] = t(:moved_to_bottom, :thing => "Ticker")
    redirect
  end
  private

  # Calls redirect_back_or_default to the index action.
  # Got tired of writing it all out for the move_* actions
  def redirect
    redirect_to(admin_tickers_path)
  end
  
  def find_ticker
    @ticker = Ticker.find(params[:id]) unless params[:id].nil?
    rescue ActiveRecord::RecordNotFound
     not_found
  end
  
  def not_found
   flash[:notice] = t(:not_found, :thing => "Ticker")
   redirect
  end  
end
