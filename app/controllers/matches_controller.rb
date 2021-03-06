class MatchesController < ApplicationController
  include UsersHelper

  before_action :user_signed_in?, :authenticate_user!, :restrict_user_access

  def index
    @matches = Match.all
  end

  def service
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      redirect_to :back
    end
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy
    # FIXME: make an asyncronous call for creating not to get all the teams all the time.
    redirect_to :back
  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    @match.update(match_params)
    redirect_to :back
  end

  def import
    begin
      Match.delay.import(params[:file])
      redirect_to :back, notice: "Matches imported."
    rescue
      redirect_to :back, notice: "Invalid CSV file format."
    end
  end

  private
    def match_params
      params.require(:match).permit(:time, :local_ratio, :visitor_ratio,
        :tie_ratio, :local_team_id, :visitor_team_id, :accepted)
    end

end
