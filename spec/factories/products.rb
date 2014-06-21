# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    company_id 1
    product_type_id 1
    box_code "MyString"
  end
end
