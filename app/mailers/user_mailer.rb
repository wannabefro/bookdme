class UserMailer < ActionMailer::Base
  default from: "bookd@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.act_signup_confirmation.subject
  #
  def act_signup_confirmation(user, act)
    @user = user
    @act = act

    mail to: user.email, subject: 'Act Sign Up Confirmation'
  end
end
