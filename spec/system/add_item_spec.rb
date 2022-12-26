require 'rails_helper'

RSpec.describe 'items', type: :system do
  before :each do
    Item.create(name: "«Amazing Spider-Man #1»", price: "$40.000", image_path: "1.jpeg", description: "Один из самых редких ныне существующих комиксов - это первое издание знаменитого «Человека-паука» под названием «Amazing Spider-Man #1».")
  end
  scenario 'add item success' do
    visit '/admin/item_create'
    fill_in 'item_name', with: 'Самолёт'
    fill_in 'item_price', with: '$100.000'
    fill_in 'item_picture', with: '8.jpeg'
    fill_in 'item_description', with: 'Крутой военный самолёт'
    click_button 'Добавить товар'
    expect(page).to have_text('Товар был создан успешно!')
  end
  scenario 'add item fail' do
    visit '/admin/item_create'
    fill_in 'item_name', with: ''
    fill_in 'item_price', with: ''
    fill_in 'item_picture', with: ''
    fill_in 'item_description', with: ''
    click_button 'Добавить товар'
    expect(page).to have_text('Путь к картинке товара не может быть пустым, Имя товара не может быть пустым, Цена товара не может быть пустым и Описание товара не может быть пустым')
  end
  scenario 'add item success' do
    visit '/admin/item_create'
    fill_in 'item_name', with: 'Самолёт'
    fill_in 'item_price', with: '$100.000'
    fill_in 'item_picture', with: ''
    fill_in 'item_description', with: 'Крутой военный самолёт'
    click_button 'Добавить товар'
    expect(page).to have_text('Путь к картинке товара не может быть пустым')
  end
  scenario 'add item success' do
    visit '/admin/item_create'
    fill_in 'item_name', with: '«Amazing Spider-Man #1»'
    fill_in 'item_price', with: '$100.000'
    fill_in 'item_picture', with: '1.jpeg'
    fill_in 'item_description', with: 'Комикс'
    click_button 'Добавить товар'
    expect(page).to have_text('Путь к картинке товара уже существует and Имя товара уже существует')
  end
end
