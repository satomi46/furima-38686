class PurchasesController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
    @purchase_delivery = PurchaseDelivery.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @purchase_delivery = PurchaseDelivery.new(purchase_params)
    if @purchase_delivery.valid?
      @purchase_delivery.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def purchase_params
    params.require(:purchase_delivery).permit(:postcode, :place_id, :city, :address, :building, :phone_number)
          .merge(item_id: params[:item_id], user_id: current_user.id)
  end

end
