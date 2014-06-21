# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stock do
    company_id 1
    product_type_id 1
    product_id 1
    batch_no "MyString"
    quantity 1
    purchase_price 1
    sales_price 1
  end
end
