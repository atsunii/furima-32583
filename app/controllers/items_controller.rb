class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.create(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :price, :explanation, :category_id, :state_id, :deliveryfee_id, :prefecture_id,
                                 :day_id).merge(user_id: current_user.id)
  end
end
