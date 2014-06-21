# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    email_id "MyString"
    first_name "MyString"
    last_name "MyString"
    address "MyString"
    birth_date "2014-05-17 21:19:09"
    mobile_no "MyString"
  end
end
