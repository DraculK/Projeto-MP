class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :admin?
  helper_method :creator?

  def admin?
    current_user && current_user.admin == true
  end

  def creator?
    unless current_user && current_user.creator == true
      flash[:error] = 'Ops... Usuário não é um criador de questionário!'
      redirect_to home_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :registration) }

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :registration, :password, :current_password)
    end
  end
end
