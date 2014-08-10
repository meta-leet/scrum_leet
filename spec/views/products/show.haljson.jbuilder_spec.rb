require 'rails_helper'

describe "products/show.haljson.jbuilder" do

  before(:example) do
    assign(:product, product)
    render
  end

  let(:product) { create(:product) }
  let(:json_parsed) { JSON.parse(rendered) }

  it "afford delete controls" do
    expect(json_parsed['_controls']['delete']).to_not eql nil
  end

  context "controls delete" do
    let(:delete_control) { json_parsed['_controls']['delete'] }

    it "provide method hint: DELETE" do
      expect(delete_control['method']).to eql "DELETE"
    end

    it "provide target url: /product/{id}" do
      expect(delete_control['target']).to eql product_url(product)
    end
  end

  it "afford update control" do
    expect(json_parsed['_controls']['update']).to_not eql nil 
  end

  context "controls update" do
    let(:update_control) { json_parsed['_controls']['update'] }

    it "provide method hint: PUT" do
      expect(update_control['method']).to eql "PUT"
    end
    
    it "provide resource url hint: product/id" do
      expect(update_control['target']).to eql product_url(product)
    end

    it "provide resource schema schema/product.json" do
      expect(update_control['schema']).to match(/schema\/product\.json/)
    end
  end



end

