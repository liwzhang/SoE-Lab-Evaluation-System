# This is the question controller. It handles routes that point to /questions.
# In general, this controller handles question management backend-wise
class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  # Shows all questions
  def index
    @questions = Question.all

    respond_to do |format|
      format.html
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  # Shows a specific question
  def show

  end

  # GET /questions/new
  # Generates a new question, but at a max of 20
  def new
    count = Question.count(:all)
    if count.nil? or count < 20
      @question = Question.new
      @question.question_ID = 0
    else
      flash[:alert] = "You can only have 20 questions"
      redirect_to action: "index"
    end
  end

  # GET /questions/1/edit
  # Edits a Question
  def edit

  end

  # POST /questions
  # POST /questions.json
  # Creates a new question
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  # Updates a question
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:question_ID, :category, :question_type, :content)
    end
end
