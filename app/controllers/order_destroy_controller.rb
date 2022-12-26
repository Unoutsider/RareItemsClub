class OrderDestroyController < ApplicationController
  def delete
    des_item = params[:item_id]
    des_user = params[:user_id]
    @meet = Meeting.where(user_id:des_user, item_id:des_item)
    @meet.destroy_all
    flash[:success] = "Вы отменили встречу!"
    redirect_to '/main/output'
  end
end
