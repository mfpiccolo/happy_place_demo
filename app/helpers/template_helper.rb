module TemplateHelper

  def bind_collection(collection, &block)
    js(
      js_class: "PurchaseOrdersController",
      function: "index",
      args: {
        template: capture(&block),
        purchase_orders: collection.to_json
      },
      rendered: true
    )
  end

end
