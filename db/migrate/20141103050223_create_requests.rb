class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :type
      t.string :shipping_address
      t.references :purchase_order, index: true

      t.timestamps
    end
  end
end
