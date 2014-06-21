require 'spec_helper'

describe "sales_order_details/edit" do
  before(:each) do
    @sales_order_detail = assign(:sales_order_detail, stub_model(SalesOrderDetail,
      :sales_order_id => 1,
      :stock_id => 1,
      :quantity => 1,
      :amount => 1
    ))
  end

  it "renders the edit sales_order_detail form" do
    render

    assert_select "form[action=?][method=?]", sales_order_detail_path(@sales_order_detail), "post" do
      assert_select "input#sales_order_detail_sales_order_id[name=?]", "sales_order_detail[sales_order_id]"
      assert_select "input#sales_order_detail_stock_id[name=?]", "sales_order_detail[stock_id]"
      assert_select "input#sales_order_detail_quantity[name=?]", "sales_order_detail[quantity]"
      assert_select "input#sales_order_detail_amount[name=?]", "sales_order_detail[amount]"
    end
  end
end
