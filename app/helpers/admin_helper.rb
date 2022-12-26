module AdminHelper
  def validate_input
    item_name = params[:item_name]
    item_price = params[:item_price]
    item_picture = params[:item_picture]
    item_description = params[:item_description]
    @item = Item.new(name: item_name, price: item_price, image_path: item_picture, description: item_description)
    unless @item.valid?
      redirect_to '/admin/item_create'
      flash[:warning] = @item.errors.full_messages.to_sentence
    else
      if Item.find_by(name: item_name)
        redirect_to '/admin/item_create'
        flash[:warning] = "Товар уже существует!"
      else
        flash[:success] = 'Товар был создан успешно!'
      end
    end
  end
end
