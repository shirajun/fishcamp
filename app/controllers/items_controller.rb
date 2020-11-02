class ItemsController < ApplicationController
  before_action :set_admin, except: :show
  before_action :set_item,  except: [:new, :create]
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
  end
  def edit
  end
  def update
    @item.update(item_params)
    if @blog.valid?
      redirect_to root_path
    else
      render :edit
    end
  end
  def destroy
    @item.destroy
    redirect_to root_path
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
  def set_item
    @item = Item.find(params[:id])
  end
end
