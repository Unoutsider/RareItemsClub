require 'rails_helper'

RSpec.describe 'users', type: :system do
  before :each do
    User.create(email: 'user@example.com', name: 'Юзер', password: 'password')
  end

  scenario 'create user' do
    visit '/users/new'
		fill_in 'email', with: 'test@test.test'
		fill_in 'name', with: 'Тест'
		fill_in 'password', with: 'test'
		fill_in 'password-confirmation', with: 'test'
		click_button 'Зарегистрироваться'
		expect(page).to have_text('Добро пожаловать, Тест!')
  end

  scenario 'log in user' do
    visit 'sessions/new'
		fill_in 'email', with: 'qwerty@mail.ru'
		fill_in 'password', with: 'qwerty'
		click_button 'Вход'
		expect(page).to have_text("Неверный e-mail или пароль")
  end

  scenario 'log in user' do
    visit 'sessions/new'
		fill_in 'email', with: 'user@example.com'
		fill_in 'password', with: 'password'
		click_button 'Вход'
		expect(page).to have_text('Добро пожаловать, Юзер!')
  end
end
