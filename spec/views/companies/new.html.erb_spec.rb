require 'spec_helper'

describe "companies/new" do
  before(:each) do
    assign(:company, stub_model(Company,
      :company_name => "MyString"
    ).as_new_record)
  end

  it "renders new company form" do
    render

    assert_select "form[action=?][method=?]", companies_path, "post" do
      assert_select "input#company_company_name[name=?]", "company[company_name]"
    end
  end
end
