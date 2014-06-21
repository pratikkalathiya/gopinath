require 'spec_helper'

describe "sales_orders/show" do
  before(:each) do
    @sales_order = assign(:sales_order, stub_model(SalesOrder,
      :customer_id => 1,
      :total_amount => 2,
      :sales_mode => "Sales Mode",
      :confirm_payment => "Confirm Payment"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Sales Mode/)
    expect(rendered).to match(/Confirm Payment/)
  end
end
