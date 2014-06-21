class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :company_id
      t.integer :product_type_id
      t.string :box_code

      t.timestamps
    end
  end
end
