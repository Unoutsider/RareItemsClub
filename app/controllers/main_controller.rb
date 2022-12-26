class MainController < ApplicationController
    def input
    end

    def output
    end

    def create
      item = params[:item_id]
      user = params[:user_id]
      if Meeting.find_by(user_id:user, item_id:item)
        flash[:warning] = "Встреча уже назначена"
        redirect_to '/main/input'
      else
        flash[:success] = "Вы назначили встречу для покупки редкого товара! Наш представитель свяжется с Вами по электронной почте."
        @order = Meeting.new(user_id:user, item_id:item)
        @order.save
        redirect_to '/main/input'
      end
    end
end
