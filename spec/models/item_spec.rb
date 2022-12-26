require 'rails_helper'

RSpec.describe Item, type: :model do
  include RSpec::Expectations
  before(:each) do
    @item = Item.new
  end

  let!(:item_data) do
   {name: 'Алмаз', price: '$9999', image_path: '100.jpeg', description: 'Description'}
  end

  let!(:item_data_repeat_name) do
   {name: 'Алмаз', price: '$99999', image_path: '10.jpeg', description: 'Description'}
  end

  let!(:item_data_repeat_image_path) do
   {name: 'Рубин', price: '$99999', image_path: '100.jpeg', description: 'Description'}
  end

  let!(:item_price_empty) do
   {name: 'Рубин', price: '', image_path: '100.jpeg', description: 'Description'}
  end

  let!(:item_description_empty) do
   {name: 'Рубин', price: '$99999', image_path: '100.jpeg', description: ''}
  end

  let!(:main_item) { Item.create(item_data) }
  let!(:data_repeat_name) { Item.create(item_data_repeat_name) }
  let!(:data_repeat_image_path) { Item.create(item_data_repeat_image_path) }
  let!(:empty_price) { Item.create(item_price_empty) }
  let!(:empty_description) { Item.create(item_description_empty) }

  it 'valid item' do
   expect(main_item.valid?).to eq(true)
  end

  it 'invalid item' do
   expect(data_repeat_name.valid?).to eq(false)
  end

  it 'invalid item' do
   expect(data_repeat_image_path.valid?).to eq(false)
  end

  it 'invalid item' do
   expect(empty_price.valid?).to eq(false)
  end
  it 'invalid item' do
   expect(empty_description.valid?).to eq(false)
  end

  it { should validate_presence_of(:image_path).with_message('не может быть пустым') }
  it { should validate_presence_of(:name).with_message('не может быть пустым') }
  it { should validate_presence_of(:price).with_message('не может быть пустым') }
  it { should validate_presence_of(:description).with_message('не может быть пустым') }
end
