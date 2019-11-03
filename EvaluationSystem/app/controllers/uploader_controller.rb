class UploaderController < ApplicationController
  def new
    @file_n = Uploader.new
  end
  def upload
    uploaded_file = params[:file]
    puts 1
  end
  def extension_white_list
    %w(csv)
  end
end
