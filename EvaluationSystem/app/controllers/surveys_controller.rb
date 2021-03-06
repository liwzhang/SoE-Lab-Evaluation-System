# This is the survey controller. It handles routes that point to /surveys.
# In general, this controller handles survey management backend-wise
class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  # GET /surveys
  # Called whenever a message is sent above 
  # Just gets all Surveys to be outputed latter
  def index
    @surveys = Survey.all

    respond_to do |format|
      format.html
      #format.csv { send_data @surveys.to_csv }
    end
  end

  # GET /surveys/1
  # GET /surveys/1.json
  # Shows a Survey when a message is sent above
  def show
    #@survey = Survey.find_by(survey_ID: params[:id])
    respond_to do |format|
      format.html
      #format.csv { send_data @survey.to_csv }
    end
  end

  # GET /surveys/new
  # Prepares a Survey when a message is sent above
  def new
    @survey = Survey.new
  end

  # GET /surveys/1/edit
  # Initates an edit Survey whenever a user goes to edit a survey
  def edit
    @questions = Question.all
    @categories = ["Learning from Labs", "Lab Instructor", "Lab Space and Equipment", "Time Required to Complete Labs", "Lecture Section Instructor"]
    @qKey = params[:queryKey]
  end

  # POST /surveys
  # POST /surveys.json
  # Creates a new survey.
  def create
    @survey = Survey.new(survey_params)

    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  # Updates a survey when a survey is completed
  def update
    @questions = Question.all
    @categories = ["Learning from Labs", "Lab Instructor", "Lab Space and Equipment", "Time Required to Complete Labs", "Lecture Section Instructor"]
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey, notice: 'Survey was successfully submitted.' }
        format.json { render :show, status: :ok, location: @survey }

        # Update 'completed' attribute to true
        submission = Survey.find_by(survey_ID: @survey.survey_ID)
        submission.update(status: true)

        # Increment 'completed' attribute for section
        @section = Section.find_by(class_num: @survey.class_num)
        @section.update(completed: @section.completed + 1)


      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  # Deletes a survey when a destroy survey request is called
  def destroy
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to surveys_url, notice: 'Survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # Verifies survey Params
    def survey_params
      params.require(:survey).permit(:student_ID, :student_email, :class_num, :survey_ID, :status, :Q1, :Q2, :Q3, :Q4, :Q5, :Q6, :Q7, :Q8, :Q9, :Q10, :Q11, :Q12, :Q13, :Q14, :Q15, :Q16, :Q17, :Q18, :Q19, :Q20)
    end
end
