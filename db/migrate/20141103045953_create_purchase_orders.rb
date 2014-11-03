class CreatePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :purchase_orders do |t|
      t.string :state
      t.string :important_info
      t.references :order, index: true

      t.timestamps
    end
  end
end
