class this.RequestsController
  constructor: ->

  @index: (args) ->
    $("#requests").html(args.requests_partial);
    $("#line_items").html(args.line_items_partial)
    $("#code").html(args.display_code)
    $("#description").html(args.description)
