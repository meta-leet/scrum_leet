require 'rails_helper'

describe "/products", :type => :request do

  let(:json_response) { JSON.parse(response.body) }
  context "GET" do

    before(:example) do 
      create(:product)
    end

    it "respond with product collection document" do
      get "/products"
      expect(response).to render_template(:index)
    end

    it "respond with collection name" do
      get "/products"
      message = JSON.parse(response.body)
      expect(message['_embeded']["products"].first["name"]).to match(/Scrum Leet/)
    end

  end

  context "POST" do
    context "on successfull request" do
      before(:example) do
        post "/products", {name: "Post test"}
      end

      it "return 200 ok" do
        expect(response.status).to eql 200
      end

      it "respond with resource representation" do
        expect(json_response['name']).to eql 'Post test'
      end

    end

  end

  context "UPDATE" do
    context "on successful request" do
      let(:product) {create(:product)}

      it "respond with modified resource" do
        put '/products/'+product.id, {name:"foo"}
        expect(json_response["name"]).to eql "foo"
      end

    end
  end

  context "DELETE" do
    context "on successful request" do
      let(:product) { create(:product) }

      it "responds with delete product" do
        delete '/products/' + product.id
        expect(json_response['name']).to eql product.name
      end

    end
  end

end
