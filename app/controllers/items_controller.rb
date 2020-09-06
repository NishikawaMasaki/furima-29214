class ItemsController < ApplicationController
  #before_action :move_to: index,

  def index
    @items = Item.all
  end
end
