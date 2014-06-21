require 'spec_helper'

describe "sales_order_details/index" do
  before(:each) do
    assign(:sales_order_details, [
      stub_model(SalesOrderDetail,
        :sales_order_id => 1,
        :stock_id => 2,
        :quantity => 3,
        :amount => 4
      ),
      stub_model(SalesOrderDetail,
        :sales_order_id => 1,
        :stock_id => 2,
        :quantity => 3,
        :amount => 4
      )
    ])
  end

  it "renders a list of sales_order_details" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
