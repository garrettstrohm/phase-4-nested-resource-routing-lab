class ItemsController < ApplicationController

  def index
    if params[:user_id]
      user = find_user
      items = user.items
    else
      items = Item.all
    end
    render json: items, include: :user
  end

  def show
      user = find_user
      item = user.items.find(params[:id])
      render json: item, include: :user
  end

  def create
    user = find_user
    item = user.items.create!(item_params)
    render json: item, status: :created
  end

  private 

  def find_user
    User.find(params[:user_id])
  end

  def item_params
    params.permit(:id, :name, :description, :price, :user_id)
  end

end
