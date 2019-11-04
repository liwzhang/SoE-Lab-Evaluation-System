require 'csv'

class UploaderController < ApplicationController
  def new
  end
  def index
  end
  def create
    uploaded_file = params[:file]
    theFrom = params[:listc]

    if theFrom == 'classes'
      
    elsif theFrom == 'roster'
      CSV.parse(uploaded_file.read, headers: true) do |row|
        @section = Section.new()
        @section.class_num = row['Class Nbr']
        @section.subject = row['Subject']
        @section.catalog = row['Catalog']
        @section.title = row['Title']
        @section.enrolled = row['Enrollment after removal of drops']
      end
    end
    redirect_to '/uploader/new'
    
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

end
