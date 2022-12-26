class AdminController < ApplicationController
  include AdminHelper
  before_action :validate_input, only: :item_insert

  def item_create
  end

  def item_insert
    unless @item.valid?
      redirect_to '/admin/item_create'
      return
    else
      @item.save
      redirect_to '/admin/item_create'
    end
  end

  def show_item
  end

  def delete_item
    des_item = params[:item_id]
    @des_item = Item.find_by(id:des_item)
    @des_item.destroy
    flash[:success] = "Вы удалили товар!"
    redirect_to '/admin/show_item'
  end

  def orders_change
    user = params[:user_id]
    item = params[:item_id]
    @meeting = Meeting.find_by(user_id: user, item_id: item)
    @meeting.status = 'Исполнен'
    @meeting.save
    flash[:success] = "Заказ исполнен!"
    redirect_to '/admin/orders_show'
  end

  def orders_show
  end
end
