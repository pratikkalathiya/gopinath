require 'spec_helper'

describe "product_types/new" do
  before(:each) do
    assign(:product_type, stub_model(ProductType,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new product_type form" do
    render

    assert_select "form[action=?][method=?]", product_types_path, "post" do
      assert_select "input#product_type_name[name=?]", "product_type[name]"
    end
  end
end
