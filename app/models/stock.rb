class Stock < ActiveRecord::Base
  belongs_to :product
  belongs_to :product_type
  belongs_to :company
end
