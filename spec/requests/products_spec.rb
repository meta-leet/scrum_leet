require 'rails_helper'

describe "/products", :type => :request do

  context "GET" do

    before(:example) do 
      create(:product)
    end

    it "respond with product collection document" do
      get "/products"
      expect(response).to render_template(:index)
    end

    it "responds with collection name" do
      get "/products"
      message = JSON.parse(response.body)
      expect(message['_embeded']["products"].first["name"]).to match(/Scrum Leet/)
    end

  end
end
