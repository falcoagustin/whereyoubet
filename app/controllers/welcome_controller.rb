class WelcomeController < ApplicationController
  def index
    @top_5_matches = Match.last(5)
    @first_5_matches = Match.first(5)
  end
end
