class RequestsFilter
  attr_reader :params, :format, :controller

  def call
    if format == :html
      @requests = Request.all
    elsif params[:all]
      @requests = Request.all
      @line_items = LineItem.all
    else
      @requests = Request.where(purchase_order_id: params[:purchase_order_id])
      @line_items = @requests.includes(:line_items).map(&:line_items).flatten.uniq
    end

    set_controller_instance_vars
  end

  def self.call(params, foramt, controller)
    new(params, foramt, controller).call
  end

  def initialize(params, foramt, controller)
    @params = params
    @format = format
    @controller = controller
  end

  def set_controller_instance_vars
    [:@requests, :@line_items].each do |var|
      controller.instance_variable_set(var, instance_variable_get(var))
    end
  end

end
