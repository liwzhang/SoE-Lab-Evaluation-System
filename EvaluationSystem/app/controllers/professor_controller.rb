class ProfessorController < ApplicationController

#check for admin redirect before load
before_action :redirect_after_sign_in

  #list of sections relevant to current professor logged in
  def sections
    if current_user
      @current_user_email = current_user.email
      @my_sections = Section.where(professor_email: @current_user_email)
    end
  end

  #after login attempt, redirect admin to admin controller
  def redirect_after_sign_in
    if current_user && current_user.admin
        redirect_to controller: 'admin', action: 'home'
    end
  end

  #sends out mail to students
  def send_mail
    StudentMailer.eval_reminder.deliver_now
  end

end
