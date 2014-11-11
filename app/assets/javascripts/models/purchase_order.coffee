class App.PurchaseOrder extends App.Base
  constructor: ->
    super

  save: ->
    if @id?
      url = "/purchase_orders/" + @id + ".js"
    else
      url = "/purchase_orders.js"

    $.ajax
      url: url
      type: "PATCH"
      data: {
        "purchase_order": @attributes,
      }

  update_attributes: (attrs) ->
    @attributes = attrs
