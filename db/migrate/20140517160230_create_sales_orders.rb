class CreateSalesOrders < ActiveRecord::Migration
  def change
    create_table :sales_orders do |t|
      t.integer :customer_id
      t.integer :total_amount
      t.string :sales_mode
      t.string :confirm_payment

      t.timestamps
    end
  end
end
