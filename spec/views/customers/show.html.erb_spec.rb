require 'spec_helper'

describe "customers/show" do
  before(:each) do
    @customer = assign(:customer, stub_model(Customer,
      :email_id => "Email",
      :first_name => "First Name",
      :last_name => "Last Name",
      :address => "Address",
      :mobile_no => "Mobile No"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Mobile No/)
  end
end
