json.array!(@customers) do |customer|
  json.extract! customer, :id, :email_id, :first_name, :last_name, :address, :birth_date, :mobile_no
  json.url customer_url(customer, format: :json)
end
