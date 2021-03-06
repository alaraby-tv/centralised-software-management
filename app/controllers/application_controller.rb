class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  add_breadcrumb "Home", :root_path

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: [:first_name, :last_name, :email, :role])
  end

  def authenticate_admin
    redirect_to root_path, flash: { error: 'You are not permited to perform this action!'} unless current_user.admin?
  end
end
