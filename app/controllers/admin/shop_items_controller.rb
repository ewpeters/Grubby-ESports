class Admin::ShopItemsController < Admin::ApplicationController
  before_filter :find_item, :except => [:new, :create, :index]
  def new
    @item = ShopItem.new
    respond_to do |format|
      format.html
    end  
  end
  def index
    @items = ShopItem.all
  end

  def show
  end
  
  def edit
  end
  
  def destroy
    @item.destroy
    flash[:notice] = t(:deleted, :thing => "Shop Item")
    redirect
  end
  
  def create
    @item = ShopItem.new(params[:shop_item])
    if @item.save
      redirect_to(admin_shop_items_path, :notice => 'Shop Item was successfully created.')
    else
      render :action => "new" 
    end
  end
  def update
    respond_to do |format|
      if @item.update_attributes(params[:shop_item])
        format.html { redirect_to(admin_shop_items_path,
                    :notice => 'Shop Item was successfully updated.') }
                    format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors,
                    :status => :unprocessable_entity }
      end
    end
  end

  def move_up
    @item.move_higher
    flash[:notice] = t(:moved_higher, :thing => "item")
    redirect
  end

  # Moves a forum one space down using an acts_as_list provided method.
  def move_down
    @item.move_lower
    flash[:notice] = t(:moved_lower, :thing => "item")
    redirect
  end

  # Moves a forum to the top using an acts_as_list provided method.
  def move_to_top
    @item.move_to_top
    flash[:notice] = t(:moved_to_top, :thing => "item")
    redirect
  end

  # Moves a forum to the bottom using an acts_as_list helper.
  def move_to_bottom
    @item.move_to_bottom
    flash[:notice] = t(:moved_to_bottom, :thing => "item")
    redirect
  end
  private

  def redirect
    redirect_to(admin_shop_items_path)
  end
  
  def find_item
    @item = ShopItem.find(params[:id]) unless params[:id].nil?
    rescue ActiveRecord::RecordNotFound
     not_found
  end
  
  def not_found
   flash[:notice] = t(:not_found, :thing => "Shop Item")
   redirect
  end
end
