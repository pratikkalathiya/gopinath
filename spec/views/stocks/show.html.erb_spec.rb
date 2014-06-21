require 'spec_helper'

describe "stocks/show" do
  before(:each) do
    @stock = assign(:stock, stub_model(Stock,
      :company_id => 1,
      :product_type_id => 2,
      :product_id => 3,
      :batch_no => "Batch No",
      :quantity => 4,
      :purchase_price => 5,
      :sales_price => 6
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Batch No/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
  end
end
