require 'spec_helper'

describe "sales_order_details/show" do
  before(:each) do
    @sales_order_detail = assign(:sales_order_detail, stub_model(SalesOrderDetail,
      :sales_order_id => 1,
      :stock_id => 2,
      :quantity => 3,
      :amount => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
