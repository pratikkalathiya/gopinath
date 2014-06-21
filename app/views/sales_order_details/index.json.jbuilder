json.array!(@sales_order_details) do |sales_order_detail|
  json.extract! sales_order_detail, :id, :sales_order_id, :stock_id, :quantity, :amount
  json.url sales_order_detail_url(sales_order_detail, format: :json)
end
