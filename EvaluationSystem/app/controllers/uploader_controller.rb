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
      k = CSV.read(uploaded_file.path)[0]
      if !check_header(k)
        puts "Not Right"
      else
        CSV.foreach(uploaded_file.path, headers: true) do |row|
          @section = Section.new()
          @section.class_num = row['Class Nbr']
          @section.subject = row['Subject']
          @section.catalog = row['Catalog']
          @section.title = row['Title']
          @section.enrolled = row['Enrollment after removal of drops']
          @section.user_ID = 1
          if !Section.exists?(class_num: @section.class_num)
            if !@section.save
              puts 'error'
            end
          end
        end
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
def check_header(x)
  t = false
  if x.include? 'Class Nbr' and x.include? 'Subject' and 
      x.include? 'Catalog' and x.include? 'Title' and
      x.include? 'Enrollment after removal of drops'
    t = true
  end
  t
end