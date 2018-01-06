require 'httparty'

class PhotosController < ApplicationController
  
  # Find photos on resources, update and show resized
  def resize_photos
    
    old_images = HTTParty.get('http://54.152.221.29/images.json')
    
    render json: old_images
  end
  
end
