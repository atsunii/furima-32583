class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    #@items = Item.all.order('created_at DESC')
  end

  def new
    @items = Item.new
  end

  def create
<<<<<<< Updated upstream
<<<<<<< Updated upstream
    @items = Item.new(item_params)
    if @items.save
=======
    @item = Item.new(item_params)
    if @item.save
>>>>>>> Stashed changes
=======
    @items = Item.new(item_params)
    if @items.save
>>>>>>> Stashed changes
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
