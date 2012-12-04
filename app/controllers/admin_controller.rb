class AdminController < ApplicationController
  before_filter :organizations_only
  before_filter :authorize_admin

  # GET /admins
  # GET /admins.json
  def index
    @user = current_org.users.find_by_name(params[:id])
    @users = current_org.users.all
    @quizzes = current_org.quizzes.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def quiz
    
    @quiz = current_org.quizzes.find_by_id(params[:quiz_id])
    
    respond_to do |format|
      format.html
    end
  end
end
