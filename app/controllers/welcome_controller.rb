class WelcomeController < ApplicationController
  def index
    @best_five_matches = Match.where(:accepted => true).last(5)
    ids = []
    for match in @best_five_matches do
      ids.push(match.id)
    end
    @hot_five_matches = Match.where.not(id: ids, accepted: false).first(5)
  end

  def all_bets
    @all_matches = Match.all
  end
end
