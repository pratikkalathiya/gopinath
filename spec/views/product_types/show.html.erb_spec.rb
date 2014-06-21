require 'spec_helper'

describe "product_types/show" do
  before(:each) do
    @product_type = assign(:product_type, stub_model(ProductType,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
