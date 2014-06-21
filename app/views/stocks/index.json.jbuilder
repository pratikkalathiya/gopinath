json.array!(@stocks) do |stock|
  json.extract! stock, :id, :company_id, :product_type_id, :product_id, :batch_no, :quantity, :purchase_price, :sales_price
  json.url stock_url(stock, format: :json)
end
