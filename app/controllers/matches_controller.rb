class MatchesController < ApplicationController
  def index
    @matches = Match.all
    puts @matches
  end

  def create
    @match = Match.new(team_params)
    if @match.save
      redirect_to :back
    end
  end

  private
    def team_params
      params.require(:match).permit(:time, :local_ratio, :visitor_ratio,
        :tie_ratio, :local_team_id, :visitor_team_id)
    end
end
