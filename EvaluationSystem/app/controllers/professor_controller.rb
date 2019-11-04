class ProfessorController < ApplicationController
  def sections
    if current_user
      @current_user_email = current_user.email
      @my_sections = Section.where(professor_email: @current_user_email)
    end
  end
end
