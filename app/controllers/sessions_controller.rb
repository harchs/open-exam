class SessionsController < ApplicationController
  def new
    respond_to do |format|
      if current_org
        format.html 
      else
        format.html { redirect_to root_url}
      end
    end
  end

  def create
    user = current_org.users.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      unless user.is_admin?
        redirect_to quizzes_path
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
