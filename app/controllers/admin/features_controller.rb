class Admin::FeaturesController < Admin::ApplicationController
  before_filter :find_feature, :except => [:new, :create, :index]
  def new
    @feature = Feature.new
    @article = @feature.build_article
    respond_to do |format|
      format.html
    end  
  end
  def index
    @features =  Feature.paginate(:order => "position ASC",:page => params[:page], :per_page => per_page)
  end

  def show
  end
  
  def edit
  end
  
  def destroy
    @feature.destroy
    flash[:notice] = t(:deleted, :thing => "Feature")
    redirect
  end
  
  def create
    @feature = Feature.new(params[:feature])
      
    respond_to do |format|
      if @feature.save
        format.html do 
          if @feature.article
            path = "/admin/features/add_files/#{@feature.id}"
          else
            path = admin_features_path
          end
          redirect_to(path, :notice => 'Feature was successfully created.') 
        end
        format.xml  { render :xml => @feature, :status => :created, :location => @feature }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @feature.errors, :status => :unprocessable_entity }
      end
    end
  end
  def update
    @feature = Feature.find(params[:id])
    respond_to do |format|
      if @feature.update_attributes(params[:feature])
        format.html do 
          if @feature.article
            path = "/admin/features/add_files/#{@feature.id}"
          else
            path = admin_features_path
          end
          redirect_to(path, :notice => 'Feature was successfully created.') 
        end
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @feature.errors,
                    :status => :unprocessable_entity }
      end
    end
  end
  def add_files
    
  end
  
  def uploader
    folder_name = "#{@feature.article.html.original_filename.gsub(/\..*/, '')}"
    
    
    unless File.exists?("public/html_files/#{folder_name}")
      Dir.mkdir("public/html_files/#{folder_name}")
    end
    
    FileUtils.mv(params[:file].path, "public/html_files/#{folder_name}/#{params[:qqfile]}")
    Rails.logger.info(params[:qqfile])
    Rails.logger.info(params[:file])
    # AWS::S3::S3Object.store(params[:qqfile], params[:file], bucket_name, :access => :public_read)
    render :layout => false
  end
  
  def move_up
    @feature.move_higher
    flash[:notice] = t(:moved_higher, :thing => "Feature")
    redirect
  end

  # Moves a forum one space down using an acts_as_list provided method.
  def move_down
    @feature.move_lower
    flash[:notice] = t(:moved_lower, :thing => "Feature")
    redirect
  end

  # Moves a forum to the top using an acts_as_list provided method.
  def move_to_top
    @feature.move_to_top
    flash[:notice] = t(:moved_to_top, :thing => "Feature")
    redirect
  end

  # Moves a forum to the bottom using an acts_as_list helper.
  def move_to_bottom
    @feature.move_to_bottom
    flash[:notice] = t(:moved_to_bottom, :thing => "Feature")
    redirect
  end
  private

  def redirect
    redirect_to(admin_features_path)
  end
  
  def find_feature
    @feature = Feature.find(params[:id]) unless params[:id].nil?
    rescue ActiveRecord::RecordNotFound
     not_found
  end
  
  def not_found
   flash[:notice] = t(:not_found, :thing => "Feature")
   redirect
  end
end
