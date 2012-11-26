class AdminController < ApplicationController
  before_filter :authorize_admin

  # GET /admins
  # GET /admins.json
  def index
    @user = User.find_by_name(params[:id])
    @users = User.all
    @quizzes = Quiz.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def quiz
    @quiz = Quiz.find_by_id(params[:quiz_id])
    
    respond_to do |format|
      format.html
    end
  end
end
