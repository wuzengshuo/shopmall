class OrdersController < AdminController
  before_action :set_order, only: [:show, :change_order_status]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  def change_order_status
    status = params[:order_type]
    if status == "agree"
      @order.update(aasm_state: "already_agree")
      redirect_to orders_path, notice: "#{@order.code} already agree!"
    elsif status == "cancel"
      @order.update(aasm_state: "canceled")
      redirect_to orders_path, notice: "#{@order.code} already cancel!"
    elsif status == "return"
      @order.update(aasm_state: "awaiting_notice")
      redirect_to orders_path, notice: "#{@order.code} already return!"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:code, :product_id, :number, :amount, :user_id, :aasm_state)
    end
end
