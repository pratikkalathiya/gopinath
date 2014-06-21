require 'spec_helper'

describe "product_types/index" do
  before(:each) do
    assign(:product_types, [
      stub_model(ProductType,
        :name => "Name"
      ),
      stub_model(ProductType,
        :name => "Name"
      )
    ])
  end

  it "renders a list of product_types" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
