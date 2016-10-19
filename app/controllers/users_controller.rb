class UsersController < ApplicationController
  # skip_before_action :verify_authenticity_token
  def edit_profile
  end

  def update
    @user = User.find(params[:id])
    if @article.update(article_params)
      redirect_to :back
    else
      redirect_to :back, notice: "There was a problem with the server."
    end
  end
  private
    def article_params
      params.permit(:name, :last_name, :birthday, :address, :phone_number)
    end
end
