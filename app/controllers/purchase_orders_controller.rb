class PurchaseOrdersController < ApplicationController
  before_action :set_purchase_order, only: [:show, :edit, :update, :destroy]

  helper_method :js
  # GET /purchase_orders
  # GET /purchase_orders.json
  def index
    @purchase_order = PurchaseOrder.new

    PurchaseOrdersFilter.(params, self)

    respond_to do |format|
      format.js {
        js(
          function: "dashboard",
          partials: {
            purchase_orders_partial: "table",
            requests_partial: "requests/table",
            line_items_partial: "line_items/table"
          },
          args: {
            display_code: display_code,
            description: description
          }
        )
      }
      format.html
    end
  end

  def rails_index
    @purchase_order = PurchaseOrder.new

    PurchaseOrdersFilter.(params, self)

    respond_to do |format|
      format.html
    end
  end

  # GET /purchase_orders/1
  # GET /purchase_orders/1.json
  def show
  end

  # GET /purchase_orders/new
  def new
    @purchase_order = PurchaseOrder.new
  end

  # GET /purchase_orders/1/edit
  def edit
  end

  # POST /purchase_orders
  # POST /purchase_orders.json
  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)

    respond_to do |format|
      if @purchase_order.save
        format.js { js }
        format.html { redirect_to @purchase_order, notice: 'Purchase order was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_order }
      else
        format.html { render :new }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_orders/1
  # PATCH/PUT /purchase_orders/1.json
  def update
    respond_to do |format|
      if @purchase_order.update(purchase_order_params)
        format.js { js }
        format.html { redirect_to @purchase_order, notice: 'Purchase order was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase_order }
      else
        format.html { render :edit }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_orders/1
  # DELETE /purchase_orders/1.json
  def destroy
    @purchase_order.destroy
    respond_to do |format|
      format.html { redirect_to purchase_orders_url, notice: 'Purchase order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order
      @purchase_order = PurchaseOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_order_params
      params.require(:purchase_order).permit(:state, :important_info, :order_id)
    end

    def display_code
      code_string = "  # app/controllers/purchase_orders_controller.rb</br>"
      File.foreach(__FILE__).each_with_index do |l,i|
        code_string << l.gsub("\n", "</br>").gsub(" ", "&nbsp;") if (i >= 5 && i <= 24)
      end
      code_string << "</br></br># app/assets/javascripts/controllers/purchase_orders_controller.coffee</br>"

      File.foreach(Rails.root.join('app', 'assets', 'javascripts', 'controllers', 'purchase_orders_controller.coffee')).each_with_index do |l,i|
        code_string << l.gsub("\n", "</br>").gsub(" ", "&nbsp;")
      end
      code_string
    end

    def description
      "You have just scoped all associated objects to Order ##{params[:order_id]}"
    end

end
