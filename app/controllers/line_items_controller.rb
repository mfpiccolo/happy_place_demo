class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all

    respond_to do |format|
      format.js {
        @line_items = @line_items.where(request_id: params[:request_id]) unless params[:all]
        js(
          partials: {line_items_partial: "table"},
          args: {
            display_code: display_code,
            description: description
          }
        )
      }
      format.html
    end
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    @line_item = LineItem.new(line_item_params)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item, notice: 'Line item was successfully created.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:sku, :price_cents, :requests_id)
    end

    def display_code
      code_string = "  # app/controllers/line_items_controller.rb</br>"
      File.foreach(__FILE__).each_with_index do |l,i|
        code_string << l.gsub("\n", "</br>").gsub(" ", "&nbsp;") if (i >= 5 && i <= 21)
      end
      code_string << "</br></br># app/assets/javascripts/controllers/line_items_controller.coffee</br>"

      File.foreach(Rails.root.join('app', 'assets', 'javascripts', 'controllers', 'line_items_controller.coffee')).each_with_index do |l,i|
        code_string << l.gsub("\n", "</br>").gsub(" ", "&nbsp;")
      end
      code_string
    end

    def description
      "You have just scoped Line Items to Request ##{params[:request_id]}"
    end
end
