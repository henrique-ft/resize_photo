require 'rails_helper'
require 'database_cleaner'

RSpec.describe PhotosController, type: :controller do

  def response_body
    JSON.parse(response.body)
  end
  
  def clean_database
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end

  describe "GET #resize_photos" do
    it "returns http success" do
      get :resize_photos
      expect(response).to have_http_status(:success)
    end
    
    it "returns a Json with 10 positions" do
      get :resize_photos
      expect(response_body.size).to eq(10)
    end
  end
  
  describe "GET #index" do
    
    it "shows a empty list when dont have image values" do
      clean_database
      get :index
      expect(response_body).to eq([])
    end
  end

end
