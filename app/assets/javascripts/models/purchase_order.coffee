class App.PurchaseOrder
  constructor: (@id) ->
    @binder = new App.DataBinder(@id, "purchase-order")
    @attributes = {}

    # Subscribe to the PubSub
    @binder.on @id + ":change", (evt, attr_name, new_val, initiator) =>
      this.set attr_name, new_val  if initiator isnt this
      return

  # The attribute setter publish changes using the DataBinder PubSub
  set: (attr_name, val) ->
    @attributes[attr_name] = val
    @binder.trigger @id + ":change", [
      attr_name
      val
      this
    ]
    return

  get: (attr_name) ->
    @attributes[attr_name]


