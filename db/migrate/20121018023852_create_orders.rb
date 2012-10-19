class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :amount
      t.integer :item_id
      t.integer :merchant_id
      t.integer :purchaser_id

      t.timestamps
    end
  end
end
