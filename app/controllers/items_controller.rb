class ItemsController < ApplicationController
  #before_action :move_to: index,

  def index
    @items = Item.all
  end

  def new
    
  end

  def create


  end

end
