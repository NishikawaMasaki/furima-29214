class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index ]
  before_action :set_item, only: [:index, :create ]

  def index
    if current_user.id == @item.user_id 
      redirect_to root_path
    end
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
   if @order.valid?
     pay_item
     @order.save
     return redirect_to root_path
   else
     render :index
   end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  private
  
  def order_params
    params.permit(:token, :postal, :prefecture, :city, :address, :building, :tel, :item_id).merge(user_id: current_user.id)
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,           # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end
