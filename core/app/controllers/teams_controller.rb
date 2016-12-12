class TeamsController < ApplicationController
  include UsersHelper

  before_action :user_signed_in?, :authenticate_user!, :restrict_user_access

  def index
    @teams = Team.all
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to :back
    end
  end

  def update
    @team = Team.find(params[:id])

    if @team.update(team_params)
      redirect_to 'index'
    # else
    #   render 'edit'
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    # FIXME: make an asyncronous call for creating not to get all the teams all the time.
    redirect_to :back
  end
  private
    def team_params
      params.require(:team).permit(:name, :country_id)
    end
end
