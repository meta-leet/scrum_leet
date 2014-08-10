require "rails_helper"

describe "products/index.haljson.jbuilder" do
  before(:example) do 
    create(:product)
    assign(:products, Product.all) 
    render
  end
  let(:json_parsed) { JSON.parse(rendered)}

  it "afford create control" do
    expect(json_parsed["_controls"]["create"]).to_not eql nil
  end

  context "create control" do
    let(:control) {json_parsed["_controls"]["create"]}
    
    it "provide http method hint: POST" do
      expect(control["method"]).to eql "POST"
    end

    it "provide create target url: /products" do
      expect(control["target"]).to eql products_url
    end

    it "provide Content Type hint: application/json" do
      expect(control["headers"]["Content-Type"]).to eql "application/json"
    end

  end

  it "embed product list" do
    expect(json_parsed['_embedded']['products']).to_not eql nil
  end

  context "embedded products list" do
    let(:embedded_products) {json_parsed["_embedded"]["products"] }

    it "length equals products count " do
      expect(embedded_products.size).to eql Product.count
    end
  end

end
