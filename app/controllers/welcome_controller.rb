class WelcomeController < ApplicationController
  def index
    @best_five_matches = Match.last(5)
    @hot_five_matches = Match.first(5)
    @all_matches = Match.all
  end
end
