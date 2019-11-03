<<<<<<< HEAD
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
    
=======
class UploaderController < ApplicationController
  def new
    @file_n = Uploader.new
  end
  def upload
    uploaded_file = params[:file]
    puts 1
>>>>>>> parent of a5e1d14... Revert "Prop upload"
  end
  def extension_white_list
    %w(csv)
  end
<<<<<<< HEAD
  def show
  end
  def update

  end
  def destroy

  end

=======
>>>>>>> parent of a5e1d14... Revert "Prop upload"
end
