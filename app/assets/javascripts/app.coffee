window.App = {}

# TODO This needs to be abstracted
App.purchase_orders ||= []
Object.observe App.purchase_orders, (changes) ->
  changes.forEach (change) ->
    if change.type == "update"
      purchase_order = change.object[change.name]
      $.each change.object, (i, purchase_order) ->
        tds = $("tr[data-purchase_order_id=" + purchase_order.id + "] td")
        $.each tds, (i, attr) ->
          attribute = $(attr).data("attr")
          $(attr).html(purchase_order[attribute])
