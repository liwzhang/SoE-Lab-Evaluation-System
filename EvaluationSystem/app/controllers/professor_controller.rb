class ProfessorController < ApplicationController
  def sections
    @current_user_ID = current_user.id
    @my_sections = Section.where(user_ID: @current_user_ID)
  end
end
