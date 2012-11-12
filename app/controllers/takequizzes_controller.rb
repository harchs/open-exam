class TakequizzesController < ApplicationController

  before_filter :authorize, only: [:create, :index, :new]

# takequiz#index (avail quizzes to take)
#quizzes/5/take => takequiz#new
# click submit quiz => create
# takequiz#show

  # def take
  #   @quiz = Quiz.find(params[:id])

  #   if @quiz.is_published
  #     respond_to do |format|
  #       format.html # take.html.erb
  #       format.json { render json: @quiz }
  #     end
  #   else
  #     redirect_to quizzes_path
  #   end
  # end

  # def record

  #   respond_to do |format|
  #     format.html
  #   end

  # end

  # GET /takequizzes
  # GET /takequizzes.json
  def index
    @takequizzes = Takequiz.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @takequizzes }
    end
  end

  # GET /takequizzes/1
  # GET /takequizzes/1.json
  def show
    @takequiz = Takequiz.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @takequiz }
    end
  end

# GET /quizzes/5/new
  # GET /takequizzes/new
  # GET /takequizzes/new.json
  def new
    @quiz = Quiz.find(params[:id])
    # @takequiz = Answer.new
    # @takequiz = Takequiz.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @takequiz }
    end
  end

  # GET /takequizzes/1/edit
  def edit
    @takequiz = Takequiz.find(params[:id])
  end

  # POST /takequizzes
  # POST /takequizzes.json
  def create
    # raise params.inspect

    #quiz
    #question
    #choice

    # quiz = Quiz.find(params[:id])

    params[:question].each do |key, value|
      answer = Answer.new(:quiz_id => params[:id].to_i, :question_id => key.to_i, :choice_id => value.to_i)
      answer.save
      # answer.quiz_id = params[:id]

      # :quiz_id => params[:id]
      # :question_id => key
      # :choice_id => value

      # save
    end

    respond_to do |format|
        format.html { redirect_to root_path, notice: 'Takequiz was successfully created.' }
    end

    # @takequiz = Takequiz.new(params[:takequiz])

    # respond_to do |format|
    #   if @takequiz.save
    #     format.html { redirect_to @takequiz, notice: 'Takequiz was successfully created.' }
    #     format.json { render json: @takequiz, status: :created, location: @takequiz }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @takequiz.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PUT /takequizzes/1
  # PUT /takequizzes/1.json
  def update
    @takequiz = Takequiz.find(params[:id])

    respond_to do |format|
      if @takequiz.update_attributes(params[:takequiz])
        format.html { redirect_to @takequiz, notice: 'Takequiz was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @takequiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /takequizzes/1
  # DELETE /takequizzes/1.json
  def destroy
    @takequiz = Takequiz.find(params[:id])
    @takequiz.destroy

    respond_to do |format|
      format.html { redirect_to takequizzes_url }
      format.json { head :no_content }
    end
  end
end
