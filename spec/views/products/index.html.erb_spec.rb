require 'spec_helper'

describe "products/index" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :company_id => 1,
        :product_type_id => 2,
        :box_code => "Box Code"
      ),
      stub_model(Product,
        :company_id => 1,
        :product_type_id => 2,
        :box_code => "Box Code"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Box Code".to_s, :count => 2
  end
end
