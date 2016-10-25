class UserMailer < ApplicationMailer
  default from: 'notifications@betmatch.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://warm-brushlands-52658.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def finished_bet_email(user, complete_bet)
    @user = user
    @complete_bet = coomplete_bet
    mail(to: @user.email, subject: 'Completed bet successfully.')
  end
end
