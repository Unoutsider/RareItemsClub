require 'spec_helper'
require 'rails_helper'

RSpec.describe SessionsController, type: :system do
	include RSpec::Expectations

  it 'should company description before visit' do
    visit home_path
    expect(page).to have_text('Добро пожаловать на сайт Rare Items Club. Наша компания занимается организацией продаж особо редких товаров, которые очень сложно достать и найти. После регистрации вы сможете перейти в каталог товаров. Поскольку товары обладают особой редкостью, их продажа осуществляется исключительно путем личной встречи с продавцом. Мы желаем вам удачи в поиске продукта, который вас особенно заинтересует!')
  end

  it 'should items collection shown' do
    visit users_show_path
    expect(page).to have_text('Все пользователи')
  end
end
