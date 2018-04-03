class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login	
  helper_method :current_user

  def current_user
    session[:user_id].nil? ? nil : User.find(session[:user_id])
  end

  def require_login
    authenticate_user || render_unauthorized
  end

  protected

	  def render_unauthorized
	    redirect_to root_path, notice: 'Access denied. Please Sign In'
	  end

  private

    def authenticate_user
      current_user.present?
    end
end
