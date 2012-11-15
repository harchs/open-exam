class ApplicationController < ActionController::Base
  protect_from_forgery

  # private

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
    redirect_to login_url, alert: "You must be signed in for this" if current_user.nil?
  end

  def authorize_admin
    redirect_to root_path unless current_user && current_user.is_admin?
  end

  def authorize_admin_or_self
    redirect_to root_path unless current_user && (current_user.is_admin? || params[:id] == current_user.id) 
  end

  helper_method :controller?, :action?

  def controller?(controller)
    controller == params[:controller]
  end

  def action?(action)
    action == params[:action]
  end

end
