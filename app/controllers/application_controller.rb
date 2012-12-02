class ApplicationController < ActionController::Base
  protect_from_forgery

  # private
  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: lambda { |exception| render_error 500, exception }
    rescue_from ActionController::RoutingError, ActionController::UnknownController, ::AbstractController::ActionNotFound, ActiveRecord::RecordNotFound, with: lambda { |exception| render_error 404, exception }
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
    if (params[:controller] == "organizations" && params[:action] == "show") || (params[:controller] == "quizzes" && params[:action] == "index")
      store_location if current_user.nil?
      redirect_to login_url if current_user.nil?
    else
      store_location
      redirect_to login_url, alert: "You must be signed in for this." if current_user.nil?
    end
  end

  def authorize_admin
    redirect_to root_path, notice: "You must be an admin for this." unless current_user && current_user.is_admin?
  end

  def authorize_superuser
    redirect_to root_path, notice: "You must be a superuser for this." unless current_user && current_user.is_superuser?
  end 

  def authorize_admin_or_superuser 
    redirect_to root_path, notice: "You must be a superuser or admin for this." unless current_user && (current_user.is_superuser? || (current_user.is_admin? && params[:id].to_i == @current_org.id))
  end  

  def authorize_admin_or_self
    redirect_to root_path unless current_user && (current_user.is_admin? || params[:id].to_i == current_user.id) 
  end

  def organizations_only
    redirect_to root_url(:subdomain => 'www') unless current_org
  end

  helper_method :controller?, :action?

  def controller?(controller)
    controller == params[:controller]
  end

  def action?(action)
    action == params[:action]
  end

  def current_org
    @current_org ||= Organization.find_by_subdomain(request.subdomain)
  end
  helper_method :current_org
  
private
  def render_error(status, exception)
    respond_to do |format|
      format.html { render template: "errors/error_#{status}", layout: 'layouts/application', status: status }
      format.all { render nothing: true, status: status }
    end
  end

    def store_location
      session[:return_to] = request.fullpath
    end
end

