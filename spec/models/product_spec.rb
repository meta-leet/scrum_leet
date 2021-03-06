require 'rails_helper'

RSpec.describe Product, :type => :model do
  it "raise validation error without name" do
    p = build(:product, name: nil)
    expect { p.save! }.to raise_error(Mongoid::Errors::Validations)
  end
end
