class BlogsController < ApplicationController
  before_action :set_admin, except: [:index, :show]
  before_action :set_blog,    only: [:show, :edit, :update, :destroy]
  def index
    @blogs = Blog.order('created_at DESC')
    @items = Item.order('created_at DESC')
  end

  def new
     @blog = Blog.new
  end
  
  def create
    @blog = Blog.new(blog_params)
    if @blog.valid?
      @blog.save
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
    @blog.update(blog_params)
    if @blog.valid?
      redirect_to root_path
    else
      render :edit
    end
  end
  def destroy
    @blog.destroy
    redirect_to root_path
  end

  private

  def blog_params
    params.require(:blog).permit(
      :image,
      :title,
      :text
    ).merge(
      user_id: current_user.admin
    )
  end
  
  def set_admin
    unless user_signed_in? && current_user.admin?
      redirect_to root_path
    end
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
  
end
