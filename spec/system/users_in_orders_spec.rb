require 'rails_helper'

RSpec.describe 'orders', type: :system do
  before :each do
    User.create(email: 'jack@mail.ru', name: 'Джек', password: '123')
    Item.create(name: "«Amazing Spider-Man #1»", price: "$40.000", image_path: "1.jpeg", description: "Один из самых редких ныне существующих комиксов - это первое издание знаменитого «Человека-паука» под названием «Amazing Spider-Man #1».")
    Meeting.create(user_id: 1, item_id: 1)
  end
  scenario 'users in orders' do
    visit '/admin/orders_show'
    expect(page).to have_text('Все заказы')
  end
end
