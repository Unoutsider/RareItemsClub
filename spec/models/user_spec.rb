require 'rails_helper'

RSpec.describe User, type: :model do
	describe 'validations' do

		let!(:user_data) do
			{email: 'samu@mail.ru', name: 'Самуэль', password: '123'}
		end

		let!(:user_data_repeat_email) do
			{email: 'samu@mail.ru', name: 'Сатоши Микому', password: '123'}
		end

		let!(:main_user) { User.create(user_data) }
		let!(:user_repeat_email) { User.create(user_data_repeat_email) }

		it 'a user with unique email is valid' do
			expect(main_user.valid?).to eq(true)
		end

		it 'a user with already existing email is invalid' do
			expect(user_repeat_email.valid?).to eq(false)
		end

		it { should validate_presence_of(:email).with_message('не может быть пустым') }
    it { should validate_presence_of(:name).with_message('не может быть пустым') }
    it { should validate_presence_of(:password).with_message('не может быть пустым') }

    context 'invalid email case' do
    	it { should_not allow_value(Faker::Lorem.word).for(:email) }
    end

    context 'valid email case' do
    	it { should allow_value(Faker::Internet.email).for(:email) }
    end

    context 'invalid name case' do
    	it { should_not allow_value('Nikola Tesla').for(:name) }
    end

    context 'valid name case' do
    	it { should allow_value('Никола Тесла').for(:name) }
    end
	end
end
