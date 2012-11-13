class Questions::AnswersController < ApplicationController
  before_filter :authorize, only: [:edit, :update, :new, :destroy]

  # GET /questions/:question_id/answers
  # GET /questions/:question_id/answers.json
  def index
    @question_answers = Question::Answer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @question_answers }
    end
  end

  # GET /questions/:question_id/answers/1
  # GET /questions/:question_id/answers/1.json
  def show
    # @question_answer = Question::Answer.new
    @question = Question.find(params[:question_id])
    @answer = Question::Answer.new(:question_id => @question.id, :quiz_id => @question.quiz.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question_answer }
    end
  end

  # GET /questions/:question_id/answers/new
  # GET /questions/:question_id/answers/new.json
  def new
    @question = Question.find(params[:question_id])
    @question_answer = Question::Answer.new(:question_id => @question.id, :quiz_id => @question.quiz.id, :user_id => current_user.id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question_answer }
    end
  end

  # GET /questions/:question_id/answers/1/edit
  def edit
    @question = Question.find(params[:question_id])
    @question_answer = Question::Answer.find(params[:id])
  end

  # POST /questions/:question_id/answers
  # POST /questions/:question_id/answers.json
  def create
    @question_answer = Question::Answer.new(params[:answer])
    respond_to do |format|
      if @question_answer.save && @question_answer.quiz.next_question(@question_answer.question)
        format.html { redirect_to new_question_answer_path(@question_answer.question_id + 1), notice: 'Answer was successfully created.' }
        format.json { render json: @question_answer, status: :created, location: @question_answer }
      else
        # redirect to quizzes when done with current quiz for now
        format.html { redirect_to quizzes_path, notice: 'Answer was successfully created.' }
        format.json { render json: @question_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions/:question_id/answers/1
  # PUT /questions/:question_id/answers/1.json
  def update
    @question_answer = Question::Answer.find(params[:id])

    respond_to do |format|
      if @question_answer.update_attributes(params[:question_answer])
        format.html { redirect_to @question_answer, notice: 'Answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/question_id/answers/1
  # DELETE /questions/question_id/answers/1.json
  def destroy
    @question_answer = Question::Answer.find(params[:id])
    @question_answer.destroy

    respond_to do |format|
      format.html { redirect_to question_answers_url }
      format.json { head :no_content }
    end
  end
end
