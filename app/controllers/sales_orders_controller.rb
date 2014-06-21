class SalesOrdersController < ApplicationController
  before_action :set_sales_order, only: [:show, :edit, :update, :destroy]

  # GET /sales_orders
  # GET /sales_orders.json
  def index
    @sales_orders = SalesOrder.all
  end

  # GET /sales_orders/1
  # GET /sales_orders/1.json
  def show
  end

  # GET /sales_orders/new
  def new
    @sales_order = SalesOrder.new
    @stock = Stock.new
    @sales_order_detail=SalesOrderDetail.new
  end

  # GET /sales_orders/1/edit
  def edit
    @stock = Stock.new
    @sales_order_detail=SalesOrderDetail.new
  end

  # POST /sales_orders
  # POST /sales_orders.json
  def create

    @sales_order = SalesOrder.new(sales_order_params)

    respond_to do |format|
      if @sales_order.save
        format.html { redirect_to new_sales_order_detail_path+'?status=Start&id='+@sales_order.id.to_s, notice: 'Sales order was successfully created.' }
        format.json { render :show, status: :created, location: @sales_order }
      else
        format.html { render :new }
        format.json { render json: @sales_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales_orders/1
  # PATCH/PUT /sales_orders/1.json
  def update
    respond_to do |format|
      if @sales_order.update(sales_order_params)
        format.html { redirect_to @sales_order, notice: 'Sales order was successfully updated.' }
        format.json { render :show, status: :ok, location: @sales_order }
      else
        format.html { render :edit }
        format.json { render json: @sales_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_orders/1
  # DELETE /sales_orders/1.json
  def destroy
    @sales_order.destroy
    respond_to do |format|
      format.html { redirect_to sales_orders_url, notice: 'Sales order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_order
      @sales_order = SalesOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sales_order_params
      params.require(:sales_order).permit(:customer_id, :total_amount, :sales_mode, :confirm_payment, :status)
    end
end
