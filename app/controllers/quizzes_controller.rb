class QuizzesController < ApplicationController
  # GET /quizzes
  # GET /quizzes.json
  before_filter :authorize, only: [:edit, :update, :new, :destroy, :index, :collaborate, :history]
  before_filter :authorize_admin, only: [:edit, :new, :destroy, :update, :create]

  def index
    @quizzes = Quiz.all


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quizzes }
    end
  end

  alias collaborate index 
  alias history index

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
    @quiz = Quiz.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quiz }
    end
  end

  # GET /quizzes/new
  # GET /quizzes/new.json
  def new
    @quiz = Quiz.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quiz }
    end
  end

  # GET /quizzes/1/edit
  def edit
    @quiz = Quiz.find(params[:id])
    @quiz.questions.build if @quiz.questions.empty?
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(params[:quiz])

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to @quiz, notice: 'Quiz was successfully created.' }
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
    @quiz = Quiz.find(params[:id])

    respond_to do |format|
      #raise params.inspect
      if @quiz.update_attributes(params[:quiz])
        format.html { redirect_to @quiz }
        format.json { head :no_content }
      elsif params["action"] == "update"
        format.html { redirect_to @quiz, notice: "Quiz must have at least one selected question." }
      else
        format.html { render action: "edit" }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz = Quiz.find_by_id(params[:id])
    @quiz.destroy

    respond_to do |format|
      format.html { redirect_to quizzes_url }
      format.json { head :no_content }
    end
  end

  def score
    @quiz = Quiz.find_by_id(params[:id])
    respond_to do |format|
      if @quiz &&   UserQuiz.find_by_user_id_and_quiz_id(current_user.id, @quiz.id) 
        @answers = current_user.answers_for_quiz(@quiz.id)
        @num_correct = QuizGrader.num_correct(current_user.answers_for_quiz(@quiz.id), @quiz)
        format.html
      else
        format.html { redirect_to quizzes_path, :notice => "You haven't taken this quiz yet." }
      end
    end
  end

  
end
