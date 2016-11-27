class RegistrationsController < Devise::RegistrationsController
  def create
    byebug
    redirect_to :back
  end
end
