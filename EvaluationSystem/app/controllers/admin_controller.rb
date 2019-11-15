class AdminController < ApplicationController
  def home
  end

  def email_students
    date = params[:send_date]
    @emails = Survey.pluck(:student_email)
    @surveys = Survey.where.not(student_email: nil)
    @surveys.each do |survey|
      #survey = Survey.find_by(student_email: email)
      section = Section.find_by(class_num: survey.class_num)
      StudentMailer.eval_email(survey, section).deliver_now
    end

  end

  def sections
  end

  def professors
  end

  def questions
  end
end
