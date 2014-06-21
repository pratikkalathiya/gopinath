class SalesOrderDetailsController < ApplicationController
  before_action :set_sales_order_detail, only: [:show, :edit, :update, :destroy]

  # GET /sales_order_details
  # GET /sales_order_details.json
  def index
    @sales_order_details = SalesOrderDetail.all
  end

  # GET /sales_order_details/1
  # GET /sales_order_details/1.json
  def show
  end

  # GET /sales_order_details/new
  def new
    if params[:id]
      @sales_order_detail = SalesOrderDetail.new
      @stock = Stock.new
      begin
        @sales_order=SalesOrder.find(params[:id])
        if @sales_order.status=='Finished'
          respond_to do |format|
            format.html { redirect_to sales_orders_path, :alert=> 'You cannot edit this sales order because this order is moved to finished state.' }
          end
        end
      rescue
        respond_to do |format|
          format.html { redirect_to sales_orders_path, :alert=> 'Something went wrong.' }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to sales_orders_path, :alert=> 'Sales order id not found.' }
      end
    end
  end

  # GET /sales_order_details/1/edit
  def edit
    @stock = Stock.new
  end

  # POST /sales_order_details
  # POST /sales_order_details.json
  def create
    @stock=Stock.find(params[:stock][:id])
    params[:sales_order_detail][:stock_id]=@stock.id
    @sales_order_detail = SalesOrderDetail.new(sales_order_detail_params)
    @stock.update(:quantity=>(@stock.quantity-(params[:sales_order_detail][:quantity]).to_i))

    if params[:commit]=='Save'
      if @sales_order_detail.save
        @sales_order=@sales_order_detail.sales_order
        @sales_order.update(:status=>'Finished', :total_amount=>@sales_order.sales_order_details.sum(:amount))
        respond_to do |format|
          if @sales_order
            format.html { redirect_to @sales_order, notice: 'Sales order Created' }
          else
            format.html { redirect_to new_sales_order_detail_path+'?status=Start&id='+@sales_order.id.to_s, :alert=> 'Sorry, Please Try Again...' }
          end
        end
      else
        respond_to do |format|
          format.html { redirect_to new_sales_order_detail_path+'?status=Start&id='+params[:sales_order_detail][:sales_order_id], :alert=> 'Sorry, Please Try Again...' }
        end
      end
    else
      respond_to do |format|
        if @sales_order_detail.save
          format.html { redirect_to new_sales_order_detail_path+'?status=Start&id='+params[:sales_order_detail][:sales_order_id], notice: 'Sales order detail was successfully created.' }
        else
          format.html { redirect_to new_sales_order_detail_path+'?status=Start&id='+params[:sales_order_detail][:sales_order_id], :alert=> 'Sorry, Please Try Again...' }
        end
      end
    end
  end

  def close
    @sales_order=SalesOrder.find(params[:id].to_i)
    @sales_order.update(:status=>'Finished', :total_amount=>@sales_order.sales_order_details.sum(:amount))
    respond_to do |format|
      if @sales_order
        format.html { redirect_to @sales_order, notice: 'Sales order Created' }
      else
        format.html { redirect_to new_sales_order_detail_path+'?status=Start&id='+@sales_order.id.to_s, :alert=> 'Sorry, Please Try Again...' }
      end
    end
  end

  # PATCH/PUT /sales_order_details/1
  # PATCH/PUT /sales_order_details/1.json
  def update
    respond_to do |format|
      if @sales_order_detail.update(sales_order_detail_params)
        format.html { redirect_to @sales_order_detail, notice: 'Sales order detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @sales_order_detail }
      else
        format.html { render :edit }
        format.json { render json: @sales_order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_order_details/1
  # DELETE /sales_order_details/1.json
  def destroy
    stock= @sales_order_detail.stock
    stock.update(:quantity=> (stock.quantity+@sales_order_detail.quantity))
    @sales_order_detail.destroy

    respond_to do |format|
      format.html { redirect_to new_sales_order_detail_path+'?status=Start&id='+@sales_order_detail.sales_order.id.to_s, notice: 'Sales order detail was successfully deleted.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_order_detail
      @sales_order_detail = SalesOrderDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sales_order_detail_params
      params.require(:sales_order_detail).permit(:sales_order_id, :stock_id, :quantity, :amount)
    end
end
