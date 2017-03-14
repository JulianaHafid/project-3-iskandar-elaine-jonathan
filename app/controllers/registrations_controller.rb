class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name, :contact, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :contact, :email, :password, :password_confirmation)
  end

  def after_sign_up_path_for(resource)
    stored_location_for(resource) || landing_path
  end

end
