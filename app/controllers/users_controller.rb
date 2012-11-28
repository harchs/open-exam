class UsersController < ApplicationController
  before_filter :organizations_only
  before_filter :authorize_admin_or_self, only: [:edit, :update, :destroy]
  before_filter :authorize_admin, only: [:add, :create_students]

  def index
    @users = current_org.users.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def invite
  end

  def create_students
    emails = params.fetch(:emails)
    OpenExamMailer.registration_invite(emails, current_org).deliver

    respond_to do |format|
      format.html { redirect_to quizzes_path }
      format.json
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if current_user.is_superuser?
      @user = User.find_by_id(params[:id])
    else
      @user = current_org.users.find(params[:id])
    end

    @quizzes = @user.quizzes

    respond_to do |format|
      format.html # show.html.erb
      format.json #{ render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new(:organization_id => current_org.id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = current_org.users.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    invite_code = params.fetch(:invite_code)

    respond_to do |format|
      if invite_code != current_org.invite_code
        format.html { 
          flash[:notice] = 'You need an invite code to join!'
          render action: "new"
        }
      elsif @user.save
        OpenExamMailer.registration_confirmation(@user).deliver
        session[:user_id] = @user.id
        format.html { redirect_to root_url, notice: 'Thanks for joining OpenExam!' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = current_org.users.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = current_org.users.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
