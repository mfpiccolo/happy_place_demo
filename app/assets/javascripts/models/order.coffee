App.order ||= {}

Object.observe App.order, (changes) ->

  # This asynchronous callback runs
  changes.forEach (change) ->
    # Letting us know what changed
    # console.log change.type, change.name, change.oldValue
    console.log change
    # console.log ("#order_" + change.object.id + "_" + change.name)
    $("#order_" + change.object.id + "_" + change.name).html("aslfkjd")
