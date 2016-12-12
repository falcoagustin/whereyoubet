class MatchResultsController < ApplicationController
  include UsersHelper

  before_action :user_signed_in?, :authenticate_user!, :restrict_user_access

  def index
    @results = MatchResult.all
  end

  def update
    @result = MatchResult.find(params[:id])
    @result.accepted = true
    @result.save
    redirect_to :back
  end
end
