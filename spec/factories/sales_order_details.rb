# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sales_order_detail do
    sales_order_id 1
    stock_id 1
    quantity 1
    amount 1
  end
end
