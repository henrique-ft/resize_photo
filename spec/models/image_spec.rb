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

end
