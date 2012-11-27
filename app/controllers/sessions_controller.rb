class SessionsController < ApplicationController
  def new
    respond_to do |format|
      format.html { redirect_to root_url } unless current_org
    end
  end

  def create
    user = current_org.users.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      unless user.is_admin?
        redirect_to root_url
      else
        redirect_to admin_path
      end
      
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end  
  end  

  def destroy 
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged Out"
  end


end
