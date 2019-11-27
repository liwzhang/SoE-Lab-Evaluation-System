require 'csv'
require 'securerandom'

class UploaderController < ApplicationController

  def new
  end

  def index
  end

  def create
    uploaded_file = params[:file]
    theFrom = params[:listc]
    k = CSV.read(uploaded_file.path)[0]
    if theFrom == 'roster'
      if !has_header_survey(k)
        puts "Not Right"
      else
        Survey.delete_all()
        if has_header_professor(k)
          insert_professors(uploaded_file.path)
        end
        insert_students(uploaded_file.path)
      end

    elsif theFrom == 'classes'
      if !has_header_sections(k)
        puts "Not Right"
      else
        insert_sections(uploaded_file.path)
      end
    end
    redirect_to '/uploader'

  end

  def extension_white_list
    %w(csv)
  end

  def show
  end

  def update

  end

  def destroy

  end

  private
  def has_header_professor(x)
    t = false
    if x.include? 'Instructor Email' and 'Class Nbr'
      t = true
    end
    t
  end

  def has_header_sections(x)
    t = false
    if x.include? 'Class Nbr' and x.include? 'Subject' and
        x.include? 'Catalog' and x.include? 'Title' and
        x.include? 'Enrollment after removal of drops'
      t = true
    end
    t
  end

  def has_header_survey(x)
    t = false
    if x.include? 'Student ID' and x.include? 'Class Nbr' and
        x.include? 'Student Email'
      t = true
    end
    t
  end

  def insert_sections(x)
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
