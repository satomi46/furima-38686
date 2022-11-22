class PurchasesController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
    @purchase_delivery = PurchaseDelivery.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @purchase_delivery = PurchaseDelivery.new(purchase_params)
    if @purchase_delivery.valid?
      pay_item
      @purchase_delivery.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def purchase_params
    params.require(:purchase_delivery).permit(:postcode, :place_id, :city, :address, :building, :phone_number)
          .merge(item_id: params[:item_id], user_id: current_user.id, price: @item.price, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: purchase_params[:price],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
