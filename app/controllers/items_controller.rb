class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :destroy]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @items = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path(@item.id)
    else
      render :new
    end
  end

  def show
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :price, :explanation, :category_id, :state_id, :deliveryfee_id, :prefecture_id,
                                 :day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
