require 'rails_helper'

RSpec.describe PhotosController, type: :controller do

  def response_body
    JSON.parse(response.body)
  end

  describe "GET #resize_photos" do
    it "returns http success" do
      get :resize_photos
      expect(response).to have_http_status(:success)
    end
    
    it "returns a Json with 10 positions in key images" do
      get :resize_photos
      expect(response_body["images"].size).to eq(10)
    end
  end

end
