class MatchesController < ApplicationController
  def index
    @mathes = Match.all
  end
end
