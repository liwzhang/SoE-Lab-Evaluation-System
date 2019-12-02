# Controller for Admin user views and models.

class AdminController < ApplicationController

  def home
  end

  # Sends scheduled emails to lab students based on user input
  def email_students
    date = params[:date][:send_email]
    reminder = params[:date][:reminder]
    #@emails = Survey.pluck(:student_email)
    @surveys = Survey.where.not(student_email: nil)

    if date == "0"
      delay = 0

    elsif date == "1"
      delay = 1.minute.from_now

    elsif date == "5"
      delay = 5.minutes.from_now

    else
      delay = 30.minutes.from_now
    end

    @surveys.each do |survey|
      #survey = Survey.find_by(student_email: email)
      section = Section.find_by(class_num: survey.class_num)
      if reminder == "0"
        StudentMailer.eval_email(survey, section).deliver_later(wait_until: delay)
      else
        StudentMailer.eval_reminder(survey, section).deliver_later(wait_until: delay)
      end

    end
  end

  def sections
  end

  #displays list of professors 
  def professors
    @professors = User.where(admin: false)
  end

  def questions
  end
end
