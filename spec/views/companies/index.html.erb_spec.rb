require 'spec_helper'

describe "companies/index" do
  before(:each) do
    assign(:companies, [
      stub_model(Company,
        :company_name => "Company Name"
      ),
      stub_model(Company,
        :company_name => "Company Name"
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
  end
end
