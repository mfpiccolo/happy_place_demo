class this.PurchaseOrdersController
  constructor: ->

  @index: (args) ->
    $("#purchase_orders").html(args.purchase_orders_partial)
    $("#requests").html(args.requests_partial);
    $("#line_items").html(args.line_items_partial)
    $("#code").html(args.display_code)
    $("#description").html(args.description)
