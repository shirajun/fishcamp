class ItemsController < ApplicationController
  before_action :set_admin, except: :show
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      return render :new
    end
  end
  def show
    @item = Item.find(params[:id])
  end
  def edit
    @item = Item.find(params[:id])
  end
  def update
    @item.update(item_params)
    if @blog.valid?
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(
      :image,
      :name,
      :text,
      :price
    ).merge(
      user_id: current_user.admin
    )
  end
  def set_admin
    unless user_signed_in? && current_user.admin?
      redirect_to root_path
    end
  end

end
