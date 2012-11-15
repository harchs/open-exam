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

  helper_method :controller?, :action?

  def controller?(controller)
    controller == params[:controller]
  end

  def action?(action)
    action == params[:action]
  end

end
