require 'spec_helper'

describe "customers/index" do
  before(:each) do
    assign(:customers, [
      stub_model(Customer,
        :email_id => "Email",
        :first_name => "First Name",
        :last_name => "Last Name",
        :address => "Address",
        :mobile_no => "Mobile No"
      ),
      stub_model(Customer,
        :email_id => "Email",
        :first_name => "First Name",
        :last_name => "Last Name",
        :address => "Address",
        :mobile_no => "Mobile No"
      )
    ])
  end

  it "renders a list of customers" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile No".to_s, :count => 2
  end
end
