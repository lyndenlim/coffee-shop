class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.float :price
      t.integer :coffee_id
      t.integer :customer_id
    end
  end
end
