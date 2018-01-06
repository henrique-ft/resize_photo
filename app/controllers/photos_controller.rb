class PhotosController < ApplicationController
  
  def index
    render_images_json
  end
  
  # Find photos on resources, update and show resized
  def resize_photos
    Image.reset_images_from_api
    render_images_json
  end
  
  private
  
  def render_images_json
    @images = Image.all
    render json: @images.map {|image| %i{large medium large original}.map{ |style| "images/#{style}_#{image["attachment_file_name"]}"} }
  end
    
end
