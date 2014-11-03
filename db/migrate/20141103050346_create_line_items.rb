class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :sku
      t.integer :price_cents
      t.references :requests, index: true

      t.timestamps
    end
  end
end
