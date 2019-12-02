# This is the sections controller. It handles routes that point to /sections.
# In general, this controller handles section management backend-wise
class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]
  before_action :downcase_email, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show]
  # GET /sections
  # GET /sections.json
  # Just shows all the sections
  def index
    @sections = Section.all

    respond_to do |format|
      format.html
      #format.csv { send_data @sections.to_csv }
    end
  end

  # GET /sections/1
  # GET /sections/1.json
  # Shows a specific section
  def show
    respond_to do |format|
      format.html
      format.csv { send_data @section.to_csv }
    end
  end

  # GET /sections/new
  # Generates a section
  def new
    @section = Section.new
  end

  # GET /sections/1/edit
  # Prepares to edit a section
  def edit
  end

  # POST /sections
  # POST /sections.json
  # Generates a new section
  def create
    @section = Section.new(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to @section, notice: 'Section was successfully created.' }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  # Updates a specific section
  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to @section, notice: 'Section was successfully updated.' }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  # Destroys a specfic section
  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to sections_url, notice: 'Sections and Surveys were successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # DELETE /sections
  # Destroys all sections and Surveys
  # It later returns an alert to the browser notifying them of the deletion
  def destroy_all
    Section.delete_all()
    Survey.delete_all()
    flash[:alert]= "All sections and surveys deleted."
    redirect_to action:'index'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Downcases an email for a professor.
    def downcase_email
      if !@section.professor_email.nil?
        @section.professor_email = @section.professor_email.downcase
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # Verfies params.
    def section_params
      params.require(:section).permit(:class_num, :professor_email, :enrolled, :completed, :subject, :catalog, :title, :section)
    end

    # Checks if a user has permissions to access a file.
    # Params: id
    def authenticate_user!
      @section = Section.find(params[:id])
      if current_user.nil?
          redirect_to '/403.html'
          return
      elsif !current_user.admin and current_user.email != @section.professor_email
        redirect_to '/403.html'
      end
      
    end
    
end
