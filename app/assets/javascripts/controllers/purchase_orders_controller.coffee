class this.PurchaseOrdersController
  constructor: ->

  @dashboard: (args) ->
    $("#purchase_orders").html(args.purchase_orders_partial)
    $("#requests").html(args.requests_partial);
    $("#line_items").html(args.line_items_partial)
    $("#code").html(args.display_code)
    $("#description").html(args.description)

  @index: (args) ->
    purchase_orders = $.parseJSON(args.purchase_orders)
    collection_elem = $("[data-collection=purchase_orders]")
    # Append empty templates
    collection_elem.html("")
    $.each purchase_orders, (i, val) ->
      added_id = $(args.template).attr("data-model-purchase-order", val.id)
      collection_elem.append(added_id)

    # Update the puchase_orders observed object
    $.extend true, App.purchase_orders,
      $.parseJSON(args.purchase_orders)
