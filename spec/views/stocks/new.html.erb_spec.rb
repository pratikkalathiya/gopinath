require 'spec_helper'

describe "stocks/new" do
  before(:each) do
    assign(:stock, stub_model(Stock,
      :company_id => 1,
      :product_type_id => 1,
      :product_id => 1,
      :batch_no => "MyString",
      :quantity => 1,
      :purchase_price => 1,
      :sales_price => 1
    ).as_new_record)
  end

  it "renders new stock form" do
    render

    assert_select "form[action=?][method=?]", stocks_path, "post" do
      assert_select "input#stock_company_id[name=?]", "stock[company_id]"
      assert_select "input#stock_product_type_id[name=?]", "stock[product_type_id]"
      assert_select "input#stock_product_id[name=?]", "stock[product_id]"
      assert_select "input#stock_batch_no[name=?]", "stock[batch_no]"
      assert_select "input#stock_quantity[name=?]", "stock[quantity]"
      assert_select "input#stock_purchase_price[name=?]", "stock[purchase_price]"
      assert_select "input#stock_sales_price[name=?]", "stock[sales_price]"
    end
  end
end
