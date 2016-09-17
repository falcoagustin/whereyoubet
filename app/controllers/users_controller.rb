class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    puts params
    @user = User.new(article_params)

    if @user.save
      render :template => 'welcome/main_site'
    end
  end
  # TODO: finish login.
  def login
  end
  private
    def article_params
      params.permit(:email, :username, :password)
    end
end
