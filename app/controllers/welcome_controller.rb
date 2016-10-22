class WelcomeController < ApplicationController
  def index
    @best_five_matches = Match.last(5)
    @hot_five_matches = Match.first(5)
  end
end
