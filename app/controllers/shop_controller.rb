class ShopController < ApplicationController
  def index
    @items = ShopItem.all
  end
end
