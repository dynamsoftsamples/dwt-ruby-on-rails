class TwainscanningController < ApplicationController
  def home
  end

  def upload
    uploaded_io = params[:RemoteFile]

    upload_dir = Rails.root.join('public', 'upload')
    unless Dir.exist?(upload_dir)
      Dir.mkdir(upload_dir)
    end

    File.open(Rails.root.join('public', 'upload', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    respond_to do |format|
      format.html.any { render text: "Successfully uploaded!"}
    end

  end
end
