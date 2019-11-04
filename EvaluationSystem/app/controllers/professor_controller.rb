class ProfessorController < ApplicationController

  def sections
    if current_user
      @current_user_ID = current_user.id
      @my_sections = Section.where(user_ID: @current_user_ID)
    end
  end

end
