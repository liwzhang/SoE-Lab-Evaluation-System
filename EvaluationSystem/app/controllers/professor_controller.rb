class ProfessorController < ApplicationController

before_action :redirect_after_sign_in

  def sections
    if current_user
      @current_user_email = current_user.email
      @my_sections = Section.where(professor_email: @current_user_email)
    end
  end


  def redirect_after_sign_in
    if current_user && current_user.admin
        redirect_to controller: 'admin', action: 'home'
    end
  end

  def send_mail
    StudentMailer.eval_reminder.deliver_now
  end

end
