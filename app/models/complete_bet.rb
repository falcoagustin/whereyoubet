class CompleteBet < ActiveRecord::Base
  belongs_to :first_bet, :class_name => 'Bet', :foreign_key => 'first_bet_id'
  belongs_to :second_bet, :class_name => 'Bet', :foreign_key => 'second_bet_id'
  belongs_to :third_bet, :class_name => 'Bet', :foreign_key => 'third_bet_id'
  has_many :bets
  after_create :send_email

  def send_email
    UserMailer.finished_bet_email(self.first_bet.user, self).deliver_later
  end

end
