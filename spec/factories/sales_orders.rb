# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sales_order do
    customer_id 1
    total_amount 1
    sales_mode "MyString"
    confirm_payment "MyString"
  end
end
