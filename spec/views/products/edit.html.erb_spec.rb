require 'spec_helper'

describe "products/edit" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :company_id => 1,
      :product_type_id => 1,
      :box_code => "MyString"
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do
      assert_select "input#product_company_id[name=?]", "product[company_id]"
      assert_select "input#product_product_type_id[name=?]", "product[product_type_id]"
      assert_select "input#product_box_code[name=?]", "product[box_code]"
    end
  end
end
