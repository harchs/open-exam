class SessionsController < ApplicationController
  def new

    respond_to do |format|
      if current_org
        if session[:user_id]
          format.html { redirect_to quizzes_path}
        else
          format.html 
        end
      else
        format.html { redirect_to root_url}
      end
    end
  end

  def create
    user = current_org.users.find_by_email(params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      unless user.is_admin?
        redirect_back_or quizzes_path
      else
        redirect_back_or admin_path
      end
      
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end  
  end  

  def destroy 
    session[:user_id] = nil
    redirect_to login_url, notice: "Logged Out"
  end

  private
    def redirect_back_or(default)
      redirect_to(session[:return_to] || default)
      clear_return_to
    end

    def clear_return_to
      session.delete(:return_to)
    end

end
