class UsersController < ApplicationController
  before_filter :authorize_admin_or_self, only: [:edit, :update, :destroy]
  
  def index
    @users = current_org.users.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = current_org.users.find(params[:id])
    @quizzes = @user.quizzes

    respond_to do |format|
      format.html # show.html.erb
      format.json #{ render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    # @user = User.new(:organization_id => current_org.id) 11/27/12
    @user = User.new
    @organization = Organization.new

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
    organization_name = params[:user][:organization]
    params[:user].delete("organization")

    org_subdomain = organization_name.gsub(/\W+/,'').downcase

    @user = User.new(params[:user])
    @organization = Organization.new(:name => organization_name, :subdomain => org_subdomain)

    respond_to do |format|
      if @user.save && @organization.save
        OpenExamMailer.registration_confirmation(@user).deliver
        @user.update_attributes(:organization_id => @organization.id, :role => "Admin")
        session[:user_id] = @user.id
        format.html { redirect_to root_url(:subdomain => @organization.subdomain), notice: 'Thanks for joining OpenExam!' }
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
