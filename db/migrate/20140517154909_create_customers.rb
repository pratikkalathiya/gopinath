class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :email_id
      t.string :first_name
      t.string :last_name
      t.string :address
      t.datetime :birth_date
      t.string :mobile_no

      t.timestamps
    end
  end
end
