require 'csv'

class UploaderController < ApplicationController
  def new
  end
  def index
  end
  def create
    uploaded_file = params[:file]
    theFrom = params[:listc]
    arr_of_arrs = CSV.parse(uploaded_file.read, headers: true)
    if theFrom == 'classes'
      
    elsif theFrom == 'roster'
      puts arr_of_arrs[0]
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
