class PurchaseOrdersFilter
  attr_reader :params, :format, :controller

  def call
    if format == :html
      @purchase_orders = PurchaseOrder.all
    elsif params[:all]
      @purchase_orders = PurchaseOrder.all
      @requests = Request.all
      @line_items = LineItem.all
    else
      @purchase_orders = PurchaseOrder.where(order_id: params[:order_id])
      @requests = @purchase_orders.includes(:requests).map(&:requests).flatten
      @line_items = @purchase_orders
        .includes(:line_items).map(&:line_items).flatten.uniq
    end

    @purchase_orders = @purchase_orders.order('id ASC')

    set_controller_instance_vars
  end

  def self.call(params, controller)
    new(params, controller).call
  end

  def initialize(params, controller)
    @params = params
    @format = controller.request.format
    @controller = controller
  end

  def set_controller_instance_vars
    [:@purchase_orders, :@requests, :@line_items].each do |var|
      controller.instance_variable_set(var, instance_variable_get(var))
    end
  end

end
