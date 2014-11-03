class DashboardsController < ApplicationController

  def show
    @orders = Order.all
    @purchase_orders = PurchaseOrder.all
    @requests = Request.all
    @line_items = LineItem.all

    respond_to do |format|
      format.js {}
      format.html
    end
  end
end
