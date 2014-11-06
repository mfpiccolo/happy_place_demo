App.purchase_orders ||= []

class this.Binder
  constructor: ->

  @index: (args) ->
    # TODO This needs to be abstracted
    Object.observe App.purchase_orders, (changes) ->
      changes.forEach (change) ->
        if change.type == "update"
          purchase_order = change.object[change.name]
          $.each change.object, (i, purchase_order) ->
            tds = $("tr[data-purchase_order_id=" + purchase_order.id + "] td")
            $.each tds, (i, attr) ->
              attribute = $(attr).data("attr")
              $(attr).html(purchase_order[attribute])


    purchase_orders = $.parseJSON(args.purchase_orders)
    # Append empty templates
    $.each purchase_orders, (i, val) ->
      added_id = $(args.template).attr("data-purchase_order_id", val.id)
      $("#purchase_orders").append(added_id)

    # Update the puchase_orders observed object
    $.extend true, App.purchase_orders,
      $.parseJSON(args.purchase_orders)

