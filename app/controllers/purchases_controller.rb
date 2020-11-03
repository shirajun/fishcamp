class PurchasesController < ApplicationController
  before_action :set_purchase
  def index
    if @item.purchase != nil
      redirect_to root_path
    else
      @purchase_order = PurchaseOrder.new
    end
  end
  def create
    @purchase_order = PurchaseOrder.new(purchase_params)
    # binding.pry
    if @purchase_order.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
      @purchase_order.save
      return redirect_to root_path
    else 
      render :index
    end
  end

  private
  def set_purchase
    @item = Item.find(params[:item_id])
  end
  def purchase_params
    params.require(:purchase_order).permit(
      :postal_code,
      :prefecture_id,
      :city,
      :address,
      :building,
      :phone_number
    ).merge(
      item_id: params[:item_id],
      token: params[:token]
    )
  end
end
