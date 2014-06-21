require 'spec_helper'

describe "sales_orders/index" do
  before(:each) do
    assign(:sales_orders, [
      stub_model(SalesOrder,
        :customer_id => 1,
        :total_amount => 2,
        :sales_mode => "Sales Mode",
        :confirm_payment => "Confirm Payment"
      ),
      stub_model(SalesOrder,
        :customer_id => 1,
        :total_amount => 2,
        :sales_mode => "Sales Mode",
        :confirm_payment => "Confirm Payment"
      )
    ])
  end

  it "renders a list of sales_orders" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Sales Mode".to_s, :count => 2
    assert_select "tr>td", :text => "Confirm Payment".to_s, :count => 2
  end
end
