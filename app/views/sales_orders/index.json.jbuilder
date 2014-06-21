json.array!(@sales_orders) do |sales_order|
  json.extract! sales_order, :id, :customer_id, :total_amount, :sales_mode, :confirm_payment
  json.url sales_order_url(sales_order, format: :json)
end
