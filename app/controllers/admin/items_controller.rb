class Admin::ItemsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      flash[:item_created_error] = "商品情報が正常に保存されませんでした。"
      redirect_to new_admin_item_path
    end
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
       flash[:notice] = "You have update Item successfully"
       redirect_to admin_item_path(@item.id)
    else
       render :edit
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :image, :is_active)
  end
  
  
end
