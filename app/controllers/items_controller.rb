class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :price, :explanation, :shipping_cost_id, :category_id,
                                :status_id, :place_id, :days_to_ship_id).merge(user_id: current_user.id)
  end
end
