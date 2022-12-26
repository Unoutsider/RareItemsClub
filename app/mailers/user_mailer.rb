class UserMailer < ActionMailer::Base
  default from: 'rareitemsclub@gmail.com'

  def notify(user)
    @user = user
    mail(to: @user.email,subject: "Назначена встреча!")
  end
end
