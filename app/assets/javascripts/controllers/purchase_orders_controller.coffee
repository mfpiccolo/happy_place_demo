class this.PurchaseOrdersController
  constructor: ->

  @dashboard: (args) ->
    $("#purchase_orders").html(args.purchase_orders_partial)
    $("#requests").html(args.requests_partial);
    $("#line_items").html(args.line_items_partial)
    $("#code").html(args.display_code)
    $("#description").html(args.description)

  @index: (args) ->
    window.po_template = args.template
    purchase_orders = $.parseJSON(args.purchase_orders)
    collection_elem = $("[data-collection=purchase_orders]")
    # Append empty templates
    collection_elem.html("")
    $.each purchase_orders, (i, val) ->
      added_id = $(args.template).attr("data-model-purchase-order", val.id)
      collection_elem.append(added_id)

      # set attrs in templates
      purchase_order = new App.PurchaseOrder(val.id)
      tds = $("tr[data-model-purchase-order=" + val.id + "] td")
      $.each tds, (i, attr) ->
        attribute = $(attr).data("attr")
        purchase_order.set(attribute, val[attribute])

  @update: ->
    alert "You updated the po!"

  @create: ->
    alert "You have created a po!"
