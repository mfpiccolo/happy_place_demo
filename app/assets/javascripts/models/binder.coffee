App.purchase_orders ||= []

class this.Binder
  constructor: ->

  @index: (args) ->
    purchase_orders = $.parseJSON(args.purchase_orders)
    # Append empty templates
    $("#purchase_orders").html("")
    $.each purchase_orders, (i, val) ->
      added_id = $(args.template).attr("data-purchase_order_id", val.id)
      $("#purchase_orders").append(added_id)

    # Update the puchase_orders observed object
    $.extend true, App.purchase_orders,
      $.parseJSON(args.purchase_orders)
