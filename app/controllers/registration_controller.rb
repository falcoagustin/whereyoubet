class RegistrationsController < Devise::RegistrationsController
  def create
    redirect_to :back
  end
end
