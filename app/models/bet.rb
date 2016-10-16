class Bet < ActiveRecord::Base
  belongs_to :user, :class_name => 'User'
  belongs_to :match, :class_name => 'Match'
end
