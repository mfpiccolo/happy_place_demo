[1,2].each do |n|
  Order.create(
    state: "new",
    customer_name: "Guy #{n}"
  )
end

Order.all.each_with_index do |o, i|
  [1,2].each do |n|
    o.purchase_orders.create(
      state: "new",
      important_info: "Info #{n + i}"
    )
  end
end

PurchaseOrder.all.each_with_index do |po, i|
  [1,2].each do |n|
    po.requests.create(
      type: "",
      shipping_address: "#{n + i} Somewhere St."
    )
  end
end

Request.all.each_with_index do |r,i|
  [1].each do |n|
    r.line_items.create(
      sku: "AB#{n + i}123AB",
      price_cents: "#{n + i}00".to_i
    )
  end
end
