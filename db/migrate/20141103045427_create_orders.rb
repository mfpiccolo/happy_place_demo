class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :state
      t.string :customer_name

      t.timestamps
    end
  end
end
