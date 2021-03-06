class Questions::AnswersController < ApplicationController
  before_filter :organizations_only
  before_filter :authorize, only: [:edit, :update, :new, :destroy]
  before_filter :already_taken, only: [:new]

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
    @answer = Answer.new(:question_id => @question.id, :quiz_id => @question.quiz.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question_answer }
    end
  end

  # GET /questions/:question_id/answers/new
  # GET /questions/:question_id/answers/new.json
  def new
    user_id = session[:user_id]
    quiz_id = Question.find(params[:question_id]).quiz_id

    @question = Question.find(params[:question_id])
    @question_answer = Answer.new(:question_id => @question.id, :quiz_id => @question.quiz.id, :user_id => current_user.id)

    # check if user has already submitted an answer for this question
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question_answer }
    end
  end

  # GET /questions/:question_id/answers/1/edit
  # def edit
  #   @question = Question.find(params[:question_id])
  #   @question_answer = Question::Answer.find(params[:id])
  # end

  # POST /questions/:question_id/answers
  def create
    @question_answer_nested = Answer.new(params[:answer])
    next_question = @question_answer_nested.quiz.next_question(@question_answer_nested.question)
    user_id = session[:user_id]
    quiz_id = Question.find(params[:question_id]).quiz_id

    respond_to do |format|
      if @question_answer_nested.save
        user_scoring = UserQuiz.find_or_create_by_user_id_and_quiz_id(user_id, quiz_id)
        if next_question
          user_scoring.update_attributes(:status => "In Progress")
          format.html { redirect_to new_question_answer_path(next_question.id) }
        else
          user_scoring.update_attributes(
            :total_questions => @question_answer_nested.quiz.approved_questions.count,
            :num_correct => QuizGrader.num_correct(current_user.answers_for_quiz(@question_answer_nested.quiz_id), @question_answer_nested.quiz),
            :status => "Completed" 
          )

          format.html { redirect_to score_path(:id => @question_answer_nested.quiz_id , :user_id => current_user.id), notice: 'Your completed quiz has been recorded.' }

        end
      else
        format.html { render action: "new" }
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

  private
    def already_taken
      if current_user.answers.any? {|q| q.question_id == params[:question_id].to_i }
        redirect_to root_path, alert: "You already answered this question"
      end
    end 


end