class QuizzesController < ApplicationController
  # GET /quizzes
  # GET /quizzes.json
  before_filter :authorize, only: [:edit, :show, :update, :new, :destroy, :index, :collaborate, :history]
  before_filter :authorize_admin, only: [:edit, :new, :destroy, :update, :create, :invite, :mail_invite]
  before_filter :organizations_only

  def index
    @ready_quizzes = current_org.quizzes.select(&:is_ready_to_take?)
    @quizzes_to_take = @ready_quizzes.select{|quiz| !current_user.has_taken?(quiz) && !current_user.has_started?(quiz)}
    @quizzes_to_resume = @ready_quizzes.select{|quiz| !current_user.has_taken?(quiz) && current_user.has_started?(quiz)}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quizzes }
    end
  end

  def collaborate
    @quizzes = current_org.quizzes.where(:is_published => false)

    respond_to do |format|
      format.html
      format.json { render json: @quizzes }
    end
  end

  def invite
    @quiz = current_org.quizzes.find(params[:id])
    @users = User.all.select{|user| !user.is_admin?}
  end

  def mail_invite
    quiz_id = params.fetch(:quiz_id).to_i
    quiz = current_org.quizzes.find(quiz_id)
    OpenExamMailer.collaboration_invite(params.fetch(:recipients), quiz).deliver
    respond_to do |format|
      format.html { redirect_to quiz_collaborate_path }
    end
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
    @quiz = current_org.quizzes.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @quiz }
    end
  end

  # GET /quizzes/new
  # GET /quizzes/new.json
  def new
    @quiz = Quiz.new(:organization_id => current_org.id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quiz }
    end
  end

  # GET /quizzes/1/edit
  def edit
    @quiz = current_org.quizzes.find(params[:id])
    @quiz.questions.build if @quiz.questions.empty?
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(params[:quiz])

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to @quiz, :flash => { :success => "Quiz was successfully created." } }
        format.json { render json: @quiz, status: :created, location: @quiz }
      else
        format.html { render action: "new" }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quizzes/1
  # PUT /quizzes/1.json
  def update
    @quiz = current_org.quizzes.find(params[:id])

    if @quiz.publish(params[:quiz][:is_published])
    else
      @quiz.errors.add :base, "Quiz must have one selected question to publish."
    end

    respond_to do |format|

      if @quiz.update_attributes(params[:quiz].except(:is_published))
        format.html { redirect_to @quiz }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz = current_org.quizzes.find_by_id(params[:id])
    @quiz.destroy

    respond_to do |format|
      format.html { redirect_to quizzes_url }
      format.json { head :no_content }
    end
  end

  def score
    @user = User.find_by_id(params[:user_id])

    respond_to do |format|
      if @user == current_user || current_user.is_admin?
        @quiz = current_org.quizzes.find_by_id(params[:id])
        @user_quiz = UserQuiz.find_by_user_id_and_quiz_id(@user.id, @quiz.id)
        @answers = @user.answers_for_quiz(@quiz.id)
        format.html
      elsif current_user.id != @user.id
        format.html { redirect_to privacy_path, :alert => "Stop trying to hack this shit" }
      else  
        format.html { redirect_to quizzes_path, :notice => "You haven't taken this quiz yet." }
      end
    end

    
  end

  
end
