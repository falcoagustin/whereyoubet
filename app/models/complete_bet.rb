class CompleteBet < ActiveRecord::Base
  belongs_to :first_bet, :class_name => 'Bet'
  belongs_to :second_bet, :class_name => 'Bet'
  belongs_to :third_bet, :class_name => 'Bet'
  has_many :bets
end
