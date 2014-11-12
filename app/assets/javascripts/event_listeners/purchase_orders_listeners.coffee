class App.PurchaseOrderListeners

  @set_listeners: ->
    $(document).on "click", ".po", (evt) ->
      po_id = $(this).data("model-purchase-order")
      state = $(this).children().eq(1).html()
      important_info = $(this).children().eq(2).html()
      $(document).off("keydown", "[data-input]")

      new App.PurchaseOrder(po_id)
      $("input#id").val(po_id)
      $("input#state").val(state)
      $("input#important_info").val(important_info)

    $(document).on "click", "#new_po", (evt) ->
      $("tbody").append($(window.po_template))

    $(document).on "click", ".save", (evt) ->
      parent = $(this).closest("[data-model-purchase-order]")
      id = parent.data("model-purchase-order")

      attrs = {}
      parent.find("[data-attr]").each (index, element) =>
        attrs[$(element).data("attr")] = $(element).html()

      po = new App.PurchaseOrder(id)
      po.set_attributes(attrs)
      po.save()

    # Keydown binding example
    $(document).on "keydown", "[data-id]", (evt) ->
      $(document).off("keydown", "[data-input]")
      id = $("[data-id]").val()
      #TODO make this part dynamic so it can work with any model
      new App.PurchaseOrder(id)

