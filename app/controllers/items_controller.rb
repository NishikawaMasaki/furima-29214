class ItemsController < ApplicationController
#before_action :move_to_index
before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    item.create
      @item = item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render :new
      end
  end

  #def move_to_index
    #unless user_signed_in?
      #redirect_to action: :new
    #end
  #end
  
    private
  
    def item_params
      params.require(:item).permit(:name, :explain, :category_id, :status_id, :shipping_fee_id, :area_id, :day_id, :price )
    end
end
