class ItemsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create ]
before_action :set_item, only: [:edit, :update, :show, :destroy ]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
 
  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def destroy
    if @item.destroy
       redirect_to root_path
    else
      render :show
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:image, :name, :explain, :price, :category_id, :status_id, :shipping_fee_id, :area_id, :day_id).merge(user_id: current_user.id)
  end
    
end
