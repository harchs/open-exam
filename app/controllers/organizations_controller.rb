class OrganizationsController < ApplicationController
  before_filter :organizations_only, :except => [:new, :create]
  before_filter :authorize, :only => [:show ]
  before_filter :authorize_admin_or_superuser, :only => [:edit]
  before_filter :authorize_superuser, :only => [ :index, :update, :destroy]
  before_filter :no_new_org, :only => [:new]
  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @organizations }
    end
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    @organization = Organization.find_by_subdomain!(request.subdomain)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @organization }
    end
  end

  # GET /organizations/new@
  # GET /organizations/new.json
  def new 
    @user = User.new
    @organization = Organization.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @organization }
    end
  end

  # GET /organizations/1/edit
  def edit
    @organization = Organization.find(params[:id])
  end

  # POST /organizations
  # POST /organizations.json
  def create

    @organization = Organization.new(params.fetch(:organization))
    @user = @organization.users.build(params.fetch(:user).merge({:role => "Admin"}))

    respond_to do |format|
      if @organization.save
        OpenExamMailer.registration_confirmation(@user).deliver
        session[:user_id] = @user.id
        format.html { redirect_to root_url(:subdomain => @organization.subdomain), notice: "Your organization has been created. Make sure to access your organization at #{@organization.subdomain}.openexam.org" }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /organizations/1
  # PUT /organizations/1.json
  def update
    @organization = Organization.find(params[:id])

    respond_to do |format|
      if @organization.update_attributes(params[:organization])
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy

    respond_to do |format|
      format.html { redirect_to organizations_url }
      format.json { head :no_content }
    end
  end

  private

  def no_new_org
    if current_org && current_user && !current_user.is_superuser?
      redirect_to user_path(current_user.id) 
    end
  end
end
