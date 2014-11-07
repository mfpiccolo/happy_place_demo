window.App = {}

# TODO This needs to be abstracted
App.purchase_orders ||= []

Object.observe App.purchase_orders, (changes) ->
  changes.forEach (change) ->
    if change.type == "update"
      $.each change.object, (i, changed_obj) ->
        tds = $("tr[data-model-purchase-order=" + changed_obj.id + "] td")
        purchase_order = new App.PurchaseOrder(changed_obj.id)
        $.each tds, (i, attr) ->
          attribute = $(attr).data("attr")
          purchase_order.set(attribute, changed_obj[attribute])
