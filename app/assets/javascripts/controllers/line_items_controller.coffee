class this.LineItemsController
  constructor: ->

  @index: (args) ->
    $("#line_items").html(args.line_items_partial);
    $("#code").html(args.display_code)
    $("#description").html(args.description)
