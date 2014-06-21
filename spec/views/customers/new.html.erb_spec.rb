require 'spec_helper'

describe "customers/new" do
  before(:each) do
    assign(:customer, stub_model(Customer,
      :email_id => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :address => "MyString",
      :mobile_no => "MyString"
    ).as_new_record)
  end

  it "renders new customer form" do
    render

    assert_select "form[action=?][method=?]", customers_path, "post" do
      assert_select "input#customer_email_id[name=?]", "customer[email_id]"
      assert_select "input#customer_first_name[name=?]", "customer[first_name]"
      assert_select "input#customer_last_name[name=?]", "customer[last_name]"
      assert_select "input#customer_address[name=?]", "customer[address]"
      assert_select "input#customer_mobile_no[name=?]", "customer[mobile_no]"
    end
  end
end
