class UserMailer < ActionMailer::Base
  default from: "no-reply@Collie"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user.confirmation.subject
  #
  def confirmation(user_id)
    @user = User.find(user_id)

    mail to: @user.email
  end
end
