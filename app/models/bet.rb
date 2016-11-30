class Bet < ActiveRecord::Base
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :match, :class_name => 'Match', :foreign_key => 'match_id'

  def is_result_available
    return self.match.match_result.nil?
  end

  def user_won_bet
    if self.is_result_available
      bet_match_mapper = {
        1 => self.bet_on_local,
        2 => self.bet_on_visitor,
        3 => self.bet_on_tie
      }
      return bet_match_mapper[self.match.winner]
    end
  end
end
