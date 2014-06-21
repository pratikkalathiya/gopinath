require 'spec_helper'

describe "stocks/index" do
  before(:each) do
    assign(:stocks, [
      stub_model(Stock,
        :company_id => 1,
        :product_type_id => 2,
        :product_id => 3,
        :batch_no => "Batch No",
        :quantity => 4,
        :purchase_price => 5,
        :sales_price => 6
      ),
      stub_model(Stock,
        :company_id => 1,
        :product_type_id => 2,
        :product_id => 3,
        :batch_no => "Batch No",
        :quantity => 4,
        :purchase_price => 5,
        :sales_price => 6
      )
    ])
  end

  it "renders a list of stocks" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Batch No".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
  end
end
