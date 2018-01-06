require 'rails_helper'
require 'database_cleaner'

RSpec.describe Image, type: :model do
  
  def clean_database
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end
  
  it "returns {} if an api sends a empty json" do
     expect(Image.get_images_urls_from_hash({})).to eq({}) 
  end

  it "returns {} if an api sends a json with a empty images key" do
     expect(Image.get_images_urls_from_hash({images: []})).to eq({}) 
  end

  it "gets image url by hash" do
     hash_test = {"images" => [{"url"=> "test"},{"url"=> "teste2"}]}
     urls = Image.get_images_urls_from_hash(hash_test) 
     expect(urls).to eq(["test", "teste2"])
  end
    
  it "creates a image by a valid image url" do
    image = Image.create_by_url("http://54.152.221.29/images/b737_5.jpg")
    expect(image).to be_truthy 
  end
end
