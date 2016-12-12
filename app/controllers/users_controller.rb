class UsersController < ApplicationController
  include UsersHelper

  before_action :user_signed_in?, :authenticate_user!

  def edit_profile
  end

  def edit_password
  end

  def bet_history
    @complete_bets = CompleteBet.where(user: current_user)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to :back
    else
      redirect_to :back, notice: "There was a problem with the server."
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :last_name, :birthday, :address,
        :phone_number, :avatar)
    end
end
