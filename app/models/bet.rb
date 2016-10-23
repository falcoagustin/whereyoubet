class Bet < ActiveRecord::Base
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :match, :class_name => 'Match', :foreign_key => 'match_id'
  has_one :complete_bet,  :foreign_key => "first_bet_id"
end
