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
        format.html { redirect_to([:admin, @article], :notice => 'Article was successfully created.') }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
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
end
