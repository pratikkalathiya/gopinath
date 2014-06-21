class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.integer :company_id
      t.integer :product_type_id
      t.integer :product_id
      t.string :batch_no
      t.integer :quantity
      t.integer :purchase_price
      t.integer :sales_price

      t.timestamps
    end
  end
end
