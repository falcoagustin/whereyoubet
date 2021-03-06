class CompleteBet < ActiveRecord::Base
  belongs_to :first_bet, :class_name => 'Bet', :foreign_key => 'first_bet_id'
  belongs_to :second_bet, :class_name => 'Bet', :foreign_key => 'second_bet_id'
  belongs_to :third_bet, :class_name => 'Bet', :foreign_key => 'third_bet_id'
  has_many :bets
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  after_create :send_email

  def send_email
    begin
      UserMailer.finished_bet_email(self.first_bet.user, self).deliver_later
    rescue
      return UserMailer::ERROR_MESSAGE
    end
  end

  def user_won_complete_bet
    if !self.second_bet.nil? and self.third_bet.nil?
      return (self.first_bet.user_won_bet and self.second_bet.user_won_bet)
    elsif !self.second_bet.nil? and !self.third_bet.nil?
      return (self.first_bet.user_won_bet and
        self.second_bet.user_won_bet and
        self.third_bet.user_won_bet)
    else
      return self.first_bet.user_won_bet
    end
  end
end
