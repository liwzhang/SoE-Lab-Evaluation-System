# This is the Uploader Controller. It handles routes that point to /uploader.
# In general, this controller is for uploading csv files.

require 'csv'
require 'securerandom'

class UploaderController < ApplicationController
  
  # GET /surveys/new
  def new
  end
  # GET /surveys
  def index
  end
  
  # POST /uploader
  # Creates multiple tables from an uploaded csv 
  # Implicit Params: file, listc
  # Exceptions: redirects back to page if headers aren't valid
  def create
    uploaded_file = params[:file]
    theFrom = 'roster'
    k = CSV.read(uploaded_file.path)[0]
    if theFrom == 'roster'
      if !has_header_survey(k)
        flash[:alert] = "The headers are incorrect."
        redirect_to '/uploader/new'
        return
      else
        Survey.delete_all()
        if has_header_roster(k)
          insert_sections_from_roster(uploaded_file.path)
        end
        if has_header_professor(k)
          insert_professors(uploaded_file.path)
        end
        insert_students(uploaded_file.path)
      end

    elsif theFrom == 'classes'
      if !has_header_sections(k)
        flash[:alert] = "The headers aren't right"
        redirect_to '/uploader/new'
        return
      else
        insert_sections_from_classes(uploaded_file.path)
      end

    end
    redirect_to '/uploader'

  end

  #To make sure something is a csv
  def extension_white_list
    %w(csv)
  end

  # GET /uploader/1
  def show
  end

  # PATCH/PUT /uploader/1
  def update

  end

  # DELETE /uploader/1
  def destroy

  end

  private
  # Checks to see if it has the necessary headers for professors
  # Params: x: the first line of a csv file
  # Returns: bool
  def has_header_professor(x)
    t = false
    if x.include? 'Instructor Email' and 'Class Nbr'
      t = true
    end
    t
  end

  # (Deprecated) Checks to see if it has the necessary headers for sections
  # Params: x: the first line of a csv file
  # Returns: bool
  def has_header_sections(x)
    t = false
    if x.include? 'Class Nbr' and x.include? 'Subject' and
        x.include? 'Catalog' and x.include? 'Title' and
        x.include? 'Enrollment after removal of drops'
      t = true
    end
    t
  end

  # Checks to see if it has the necessary headers for rosters to fill in sections
  # Params: x: the first line of a csv file
  # Returns: bool
  def has_header_roster(x)
    t = false
    if x.include? 'Class Nbr' and x.include? 'Subject' and
        x.include? 'Catalog' and x.include? 'Title' and x.include? 'Tot Enrl'
      t = true
    end
    t
  end

  # Checks to see if it has the necessary headers for surveys
  # Params: x: the first line of a csv file
  # Returns: bool
  def has_header_survey(x)
    t = false
    if x.include? 'Student ID' and x.include? 'Class Nbr' and
        x.include? 'Student Email' 
      t = true
    end
    t
  end

  # (Deprecated) Inserts the sections into the sections table from a class csv
  # Precondition: the Headers 'Class Nbr', 'Subject', 'Catalog', 'Title' 
  # and 'Enrollment after removal of drops' are in the first line of the csv
  # Params: x:The file path for the csv
  # Returns: None
  def insert_sections_from_classes(x)
    CSV.foreach(x, headers: true) do |row|
      @section = Section.new()
      @section.class_num = row['Class Nbr']
      @section.subject = row['Subject']
      @section.catalog = row['Catalog']
      @section.title = row['Title']
      @section.enrolled = row['Enrollment after removal of drops']
      if !Section.exists?(class_num: @section.class_num)
        if !@section.save
          puts 'error'
        end
      else
        flash[:alert] = "Some values were ommited"
      end
    end
  end

  # Inserts the sections into the sections table from a roster csv
  # Precondition: the Headers 'Class Nbr', 'Subject', 'Catalog', 'Title' 
  # and 'Tot Enrl' are in the first line of the csv
  # Params: x:The file path for the csv
  def insert_sections_from_roster(x)
    CSV.foreach(x, headers: true) do |row|
      @section = Section.new()
      @section.class_num = row['Class Nbr']
      @section.subject = row['Subject']
      @section.catalog = row['Catalog']
      @section.title = row['Title']
      @section.enrolled = row['Tot Enrl']
      if !Section.exists?(class_num: @section.class_num)
        if !@section.save
          puts 'error'
        end
      else
        flash[:alert] = "Some values were ommited"
      end
    end
  end

  # Inserts the professors into the sections table from a roster csv
  # Precondition: Professor has a section; Instructor email and class Nbr
  # are in the first line of the csv
  # Params: x:The file path for the csv
  # Exceptions: Professor does not have a section
  def insert_professors(x)
    CSV.foreach(x, headers: true) do |row|
      @section = Section.find_by(class_num: row['Class Nbr'])
      if @section.nil?
        puts 'professor does not have a section'
      elsif !(row['Instructor Email'].nil?)
        @section.professor_email = row['Instructor Email'].downcase
        if !@section.save
          puts @section.errors.full_messages
        end
      end
    end
  end

  # Inserts the student surveys into the survey table from a roster csv
  # Precondition: 'Student ID','Class Nbr', 'Student Email'
  # are in the first line of the csv
  # Params: x:The file path for the csv
  def insert_students(x)
    y = Survey.maximum('survey_ID')
    surveycount = 0
    if !y.nil?()
      surveycount = y + 1
    end
    #remeber to lowercase emails
    CSV.foreach(x, headers: true) do |row|
      @survey = Survey.new()
      @survey.student_ID = row['Student ID']
      @survey.class_num =row['Class Nbr']
      @survey.student_email =row['Student Email']
      @survey.survey_ID = surveycount
      @survey.status = 'false'
      @survey.key = SecureRandom.alphanumeric
      if !Survey.exists?(class_num: @survey.class_num, student_ID: @survey.student_ID)
        if !@survey.save
          puts @survey.errors.full_messages
        else
          surveycount = surveycount + 1
        end
      end
    end
  end
end
