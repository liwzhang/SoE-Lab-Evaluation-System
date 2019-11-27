class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]
  before_action :downcase_email, only: [:show, :edit, :update, :destroy]
  before_action :autenticate_user!, only: [:show]
  # GET /sections
  # GET /sections.json
  def index
    @sections = Section.all

    respond_to do |format|
      format.html
      #format.csv { send_data @sections.to_csv }
    end
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
    respond_to do |format|
      format.html
      format.csv { send_data @section.to_csv }
    end
  end

  # GET /sections/new
  def new
    @section = Section.new
  end

  # GET /sections/1/edit
  def edit
  end

  # POST /sections
  # POST /sections.json
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
  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to sections_url, notice: 'Section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    def downcase_email
      if !@section.professor_email.nil?
        @section.professor_email = @section.professor_email.downcase
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:class_num, :professor_email, :enrolled, :completed, :subject, :catalog, :title, :section)
    end

    def autenticate_user!
      @section = Section.find(params[:id])
      if current_user.nil?
          redirect_to root_path
          return
      elsif !current_user.admin and current_user.email != @section.professor_email
        redirect_to root_path
      end
      
    end
    
end
