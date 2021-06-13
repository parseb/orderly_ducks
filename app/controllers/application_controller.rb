class ApplicationController < ActionController::Base

  before_action :devise_permited, if: :devise_controller? 


  def after_sign_in_path_for(resource)
    workspace_path(current_user) 
  end

  protected

  def devise_permited
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
