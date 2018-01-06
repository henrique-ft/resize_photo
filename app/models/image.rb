require 'httparty'

class Image

  include Mongoid::Document
  include Mongoid::Paperclip

  has_mongoid_attached_file :attachment, styles: { small: '320x240>', medium: "384x288>", large: "640x480>" }, url: "/images/:style_:basename.:extension"
  validates_attachment :attachment, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  def self.create_by_url(url)
    image = new
    image.attachment = URI.parse(url)
    image.save
  end

  def self.get_from_api
    http_request = HTTParty.get('http://54.152.221.29/images.json')
    
    return {} if http_request.body.nil? or not http_request.body['images'].present?
    json = JSON.parse(http_request.body)
    json['images'].map { |image| image['url'] }
  end

  def self.reset_images_from_api
    Image.destroy_all
    Image.get_from_api.map { |url| Image.create_by_url url }
  end

end
