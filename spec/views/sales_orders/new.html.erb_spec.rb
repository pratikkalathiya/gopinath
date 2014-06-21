require 'spec_helper'

describe "sales_orders/new" do
  before(:each) do
    assign(:sales_order, stub_model(SalesOrder,
      :customer_id => 1,
      :total_amount => 1,
      :sales_mode => "MyString",
      :confirm_payment => "MyString"
    ).as_new_record)
  end

  it "renders new sales_order form" do
    render

    assert_select "form[action=?][method=?]", sales_orders_path, "post" do
      assert_select "input#sales_order_customer_id[name=?]", "sales_order[customer_id]"
      assert_select "input#sales_order_total_amount[name=?]", "sales_order[total_amount]"
      assert_select "input#sales_order_sales_mode[name=?]", "sales_order[sales_mode]"
      assert_select "input#sales_order_confirm_payment[name=?]", "sales_order[confirm_payment]"
    end
  end
end
