class WelcomeController < ApplicationController
  def index
    @best_five_matches = Match.last(5)
    @hot_five_matches = Match.first(5)
  end

  def all_matches
    @all_matches = Match.all
  end
end
