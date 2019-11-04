require 'csv'

class UploaderController < ApplicationController

  def new
  end

  def index
  end

  def create
    uploaded_file = params[:file]
    arr_of_arrs = CSV.parse(uploaded_file.read)
    puts arr_of_arrs
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
