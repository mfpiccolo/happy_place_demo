PurchaseOrder = (uid) ->
  binder = new DataBinder(uid)
  purchase_order =
    attributes: {}

    # The attribute setter publish changes using the DataBinder PubSub
    set: (attr_name, val) ->
      @attributes[attr_name] = val
      binder.trigger uid + ":change", [
        attr_name
        val
        this
      ]
      return

    get: (attr_name) ->
      @attributes[attr_name]

    _binder: binder


  # Subscribe to the PubSub
  binder.on uid + ":change", (evt, attr_name, new_val, initiator) ->
    purchase_order.set attr_name, new_val  if initiator isnt purchase_order
    return

  purchase_order
