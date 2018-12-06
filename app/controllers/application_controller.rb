class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller? 
  
  protected
  
  def configure_permitted_parameters #defining the parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :title, :thumbnail)} #permit the parameters for the signup page
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :title, :thumbnail, :description, :itunes, :twitter, :instagram)}
  end #account_update is the edit page & all the attributes are being permitted
end
