class SalesOrder < ActiveRecord::Base
  belongs_to :customer
  has_many :sales_order_details
end
