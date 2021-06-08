require "rails_helper"

RSpec.describe "TextImages", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/text_images/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/text_images/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/text_images/destroy"
      expect(response).to have_http_status(:success)
    end
  end
end
