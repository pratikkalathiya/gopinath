require 'spec_helper'

describe "customers/edit" do
  before(:each) do
    @customer = assign(:customer, stub_model(Customer,
      :email_id => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :address => "MyString",
      :mobile_no => "MyString"
    ))
  end

  it "renders the edit customer form" do
    render

    assert_select "form[action=?][method=?]", customer_path(@customer), "post" do
      assert_select "input#customer_email_id[name=?]", "customer[email_id]"
      assert_select "input#customer_first_name[name=?]", "customer[first_name]"
      assert_select "input#customer_last_name[name=?]", "customer[last_name]"
      assert_select "input#customer_address[name=?]", "customer[address]"
      assert_select "input#customer_mobile_no[name=?]", "customer[mobile_no]"
    end
  end
end
