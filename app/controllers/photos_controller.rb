class PhotosController < ApplicationController
  
  #-----------------------------#
  # Render all images available #
  #-----------------------------#
  def index
    render_images_json
  end
  
  #-----------------------------------------------------------------------------------------#
  # Get the images from api, reset our database with the new images and show in json format #
  #-----------------------------------------------------------------------------------------#
  def resize_photos
    Image.reset_all_getting_from_api('http://54.152.221.29/images.json')
    render_images_json
  end
  
  private
  
  #------------------------------------------------------#
  # Aux function to render all images and urls available #
  #------------------------------------------------------#  
  def render_images_json
    @images = Image.all
    render json: @images.map {|image| %i{large medium large original}.map{ |style| "images/#{style}_#{image["attachment_file_name"]}"} }
  end
    
end
