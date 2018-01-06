require 'httparty'

class Image

  include Mongoid::Document
  include Mongoid::Paperclip
  
  #------------------------------------------------------------------------#
  # Informs that this class has a upload file, inform a url and itś styles #
  #------------------------------------------------------------------------#
  has_mongoid_attached_file :attachment, styles: { small: '320x240>', medium: "384x288>", large: "640x480>" }, url: "/images/:style_:basename.:extension"
  
  #-----------------------------------#
  # Validates the content of a attachment #
  #-----------------------------------#
  validates_attachment :attachment, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
    
  #------------------------------------------------------#
  # Given an url, this function saves a image in mongoDB #
  #------------------------------------------------------#
  def self.create_by_url(api_url)
    image = new
    image.attachment = URI.parse(api_url)
    image.save
  end

  #--------------------------------#
  # Get all images url from an api #
  #--------------------------------#
  def self.get_from_api(api_url)
    http_request = HTTParty.get(api_url)
    return {} if http_request.body.nil? 
    get_images_urls_from_hash(JSON.parse(http_request.body))
  end

  #-----------------------------#
  # Get images url from an hash #
  #-----------------------------#  
  def self.get_images_urls_from_hash(hash)
    return {} if not hash['images'].present?
    hash['images'].map { |image| image['url'] }    
  end

  #------------------------------------------------------------------------------#
  # Resets mongoDB images with theirs respectives sizes finding in the given api #
  #------------------------------------------------------------------------------#
  def self.reset_all_getting_from_api(api_url)
    Image.destroy_all
    Image.get_from_api(api_url).map { |url| Image.create_by_url url }
  end

end
