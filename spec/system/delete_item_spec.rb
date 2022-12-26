require 'rails_helper'

RSpec.describe 'items', type: :system do
  before :each do
    Item.create(name: "«Amazing Spider-Man #1»", price: "$40.000", image_path: "1.jpeg", description: "Один из самых редких ныне существующих комиксов - это первое издание знаменитого «Человека-паука» под названием «Amazing Spider-Man #1».")
  end
  scenario 'delete item success' do
    visit '/admin/show_item'
    click_button 'Удалить товар'
    expect(page).to have_text('Вы удалили товар!')
  end
end
