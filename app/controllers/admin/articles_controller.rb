class Admin::ArticlesController < Admin::ApplicationController
  def new
    @article = Article.new
    respond_to do |format|
      format.html
    end  
  end
  def index
     @articles = Article.paginate(:page => params[:page], :per_page => per_page)
  end
  def show
    @article = Article.find(params[:id])
  end
  
  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])
    respond_to do |format|
      if @article.save
        format.html do 
          path = "/admin/articles/add_files/#{@article.id}"
          redirect_to(path, :notice => 'Article was successfully created.')
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @article = Article.find(params[:id]).destroy
    flash[:notice] = t(:deleted, :thing => "Article")
    redirect_to(admin_articles_path)
  end
  
  def update
    @article = Article.find(params[:id])
 
    respond_to do |format|
      if @article.update_attributes(params[:post])
        format.html { redirect_to(@article,
                      :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors,
                      :status => :unprocessable_entity }
      end
    end
  end
  
  def add_files
    
  end
  
  def uploader
    @article = Article.find(params[:id])
    folder_name = "#{@article.html.original_filename.gsub(/\..*/, '')}"
    
    
    unless File.exists?("public/html_files/#{folder_name}")
      Dir.mkdir("public/html_files/#{folder_name}")
    end
    
    FileUtils.mv(params[:file].path, "public/html_files/#{folder_name}/#{params[:qqfile]}")  
    render :layout => false  
  end
end
