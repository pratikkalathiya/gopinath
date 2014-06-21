class SalesOrderDetail < ActiveRecord::Base
  belongs_to :stock
  belongs_to :sales_order
end
