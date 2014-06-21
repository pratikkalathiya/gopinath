json.array!(@products) do |product|
  json.extract! product, :id, :company_id, :product_type_id, :box_code
  json.url product_url(product, format: :json)
end
