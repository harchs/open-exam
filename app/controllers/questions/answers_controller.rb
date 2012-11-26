class Questions::AnswersController < ApplicationController
  before_filter :authorize, only: [:edit, :update, :new, :destroy]
  # before_filter :has_not_taken, only: [:new, :create]

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
    user_id = session[:user_id]
    quiz_id = Question.find(params[:question_id]).quiz_id

    if UserQuiz.where(:user_id => user_id).where(:quiz_id => quiz_id).empty?
      UserQuiz.create(:user_id => user_id, 
                      :quiz_id => quiz_id,
                      :status => "In Progress" )
    end

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
  def create
    @question = Question.find(params[:question_id])
    @question_answer = Question::Answer.new(:question_id => @question.id, :quiz_id => @question.quiz.id, :user_id => current_user.id)

    @question_answer_nested = Question::Answer.new(params[:answer])
    next_question = @question_answer_nested.quiz.next_question(@question_answer_nested.question)
    user_id = session[:user_id]
    quiz_id = Question.find(params[:question_id]).quiz_id

    respond_to do |format|
      if @question_answer_nested.save
        if next_question
          format.html { redirect_to new_question_answer_path(next_question.id), notice: 'Continue your quiz.' }
        else

          user_scoring = UserQuiz.where(:user_id => user_id).where(:quiz_id => quiz_id)
          UserQuiz.update( user_scoring,
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
    # def has_not_taken
    #   if current_user.answers.any? {|q| q.question_id == params[:question_id].to_i }
    #     redirect_to root_path, alert: "You already answered this one"
    #   end
    # end 

end
