module UsersHelper
	def validate_input
		@user = User.new(params.permit(:email, :name, :password, :password_confirmation))
		unless @user.valid?
			redirect_to '/users/new'
			flash[:warning] = @user.errors.full_messages.to_sentence
		else
			flash[:success] = 'Пользователь был создан успешно!'
		end
	end
end
