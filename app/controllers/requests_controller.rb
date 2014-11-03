class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
    RequestsFilter.(params, request.format, self)

    respond_to do |format|
      format.js {
        js(
          partials: {
            requests_partial: "table",
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

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:type, :shipping_address, :purchase_order_id)
    end

    def display_code
      code_string = "  # app/controllers/requests_controller.rb</br>"
      File.foreach(__FILE__).each_with_index do |l,i|
        code_string << l.gsub("\n", "</br>").gsub(" ", "&nbsp;") if (i >= 5 && i <= 23)
      end
      code_string << "</br></br># app/assets/javascripts/controllers/requests_controller.coffee</br>"

      File.foreach(Rails.root.join('app', 'assets', 'javascripts', 'controllers', 'requests_controller.coffee')).each_with_index do |l,i|
        code_string << l.gsub("\n", "</br>").gsub(" ", "&nbsp;")
      end
      code_string
    end

    def description
      "You have just scoped Requests and Line Items to Purchase Order ##{params[:purchase_order_id]}"
    end
end
