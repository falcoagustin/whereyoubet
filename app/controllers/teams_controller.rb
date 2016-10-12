class TeamsController < ApplicationController
  def new
    @team = Team.new
    @teams = Team.all
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      @teams = Team.all
      render 'new'
    end
  end

  def update
    @team = Team.find(params[:id])

    if @team.update(team_params)
      redirect_to 'new'
    # else
    #   render 'edit'
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to 'new'
  end
  private
    def team_params
      params.require(:team).permit(:name, :country_id)
    end
end
