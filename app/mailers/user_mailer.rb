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

  def act_book_confirmation(user, act)
    @user = user
    @act = act

    mail to: user.email, subject: "You just bookd #{@act.name}"
  end

  def act_proposal(user, act, proposal)
    @user = user
    @act = act
    @proposal = proposal
    mail to: act.user.email, subject: "#{@user.first_name} wants to book you"
  end
end
