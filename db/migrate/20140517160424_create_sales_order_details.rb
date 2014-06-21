class CreateSalesOrderDetails < ActiveRecord::Migration
  def change
    create_table :sales_order_details do |t|
      t.integer :sales_order_id
      t.integer :stock_id
      t.integer :quantity
      t.integer :amount

      t.timestamps
    end
  end
end
