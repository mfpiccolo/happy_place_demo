App.purchase_orders = [];

Object.observe(App.purchase_orders, function(changes) {
  return changes.forEach(function(change) {
    var purchase_order;
    if (change.type === "update") {
      purchase_order = change.object[change.name];
      return $.each(change.object, function(i, purchase_order) {
        var tds;
        tds = $("tr[data-purchase_order_id=" + purchase_order.id + "] td");
        return $.each(tds, function(i, attr) {
          var attribute;
          attribute = $(attr).data("attr");
          return $(attr).html(purchase_order[attribute]);
        });
      });
    }
  });
});

Binder.index(
  {
    template: '<tr><td data-attr=\"state\"></td><td data-attr=\"important_info\"></td><td data-attr=\"order_id\"></td></tr>',
    purchase_orders: '[{\"id\":2,\"state\":\"new\",\"important_info\":\"Info 2\",\"order_id\":1,\"created_at\":\"2014-11-03T09:55:51.752Z\",\"updated_at\":\"2014-11-03T09:55:51.752Z\"},{\"id\":3,\"state\":\"new\",\"important_info\":\"Info 2\",\"order_id\":2,\"created_at\":\"2014-11-03T09:55:51.754Z\",\"updated_at\":\"2014-11-03T09:55:51.754Z\"},{\"id\":4,\"state\":\"new\",\"important_info\":\"Info 3\",\"order_id\":2,\"created_at\":\"2014-11-03T09:55:51.755Z\",\"updated_at\":\"2014-11-03T09:55:51.755Z\"}]'
  }
);
