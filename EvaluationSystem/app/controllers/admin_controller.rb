# Controller for Admin user views and models.

class AdminController < ApplicationController

  def home
  end

  # Sends scheduled emails to lab students based on user input
  def email_students
    date = params[:date][:send_email]
    @emails = Survey.pluck(:student_email)
    @surveys = Survey.where.not(student_email: nil)

    if date == "0"
      delay = 0

    elsif date == "1"
      delay = Date.tomorrow.noon

    elsif date == "2"
      delay = 2.days.from_now.noon

    else
      delay = 1.week.from_now.noon
    end

    @surveys.each do |survey|
      #survey = Survey.find_by(student_email: email)
      section = Section.find_by(class_num: survey.class_num)
      StudentMailer.eval_email(survey, section).deliver_later(wait_until: delay)
    end
  end

  def sections
  end

  def professors
    @professors = User.where(admin: false)
  end

  def questions
  end
end
