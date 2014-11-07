window.App = {}

# TODO This needs to be abstracted
App.purchase_orders ||= []
Object.observe App.purchase_orders, (changes) ->
  changes.forEach (change) ->
    console.log change
    if change.type == "update"
      purchase_order = change.object[change.name]
      $.each change.object, (i, purchase_order) ->
        tds = $("tr[data-purchase_order_id=" + purchase_order.id + "] td")
        $.each tds, (i, attr) ->
          attribute = $(attr).data("attr")
          $(attr).html(purchase_order[attribute])

jQuery(document).on "keydown", "[data-input]", (evt) ->
  id = $("[data-id]").val()
  input_type = $(this).data("input")
  changed = $(this).val()
  $($("[data-attr=" + input_type + "]")[id - 1]).html(changed)


DataBinder = (object_id) ->

  # Use a jQuery object as simple PubSub
  pubSub = jQuery({})

  # We expect a `data` element specifying the binding
  # in the form: data-bind-<object_id>="<property_name>"
  data_attr = "input"
  message = object_id + ":change"

  # Listen to change events on elements with the data-binding attribute and proxy
  # them to the PubSub, so that the change is "broadcasted" to all connected objects
  jQuery(document).on "change", "[data-input]", (evt) ->
    $input = jQuery(this)
    pubSub.trigger message, [
      $input.data(data_attr)
      $input.val()
    ]
    return


  # PubSub propagates changes to all bound elements, setting value of
  # input tags or HTML content of other tags
  pubSub.on message, (evt, prop_name, new_val) ->
    jQuery("[data-" + data_attr + "=" + prop_name + "]").each ->
      $bound = jQuery(this)
      if $bound.is("input, textarea, select")
        $bound.val new_val
      else
        $bound.html new_val
      return

    return

  pubSub
