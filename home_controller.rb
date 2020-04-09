class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:comment_create]
  before_action :set_product, only: [:show]
  def index
    @q = Product.where(on_shelf: true).ransack(params[:q])
    @products = @q.result(distinct: true)
  end

  def show
  end

  def order_list
    @orders = current_user.orders
  end

  def cancel_order
    order_id = params[:order_id]
    order = Order.find_by(id: order_id)
    order.update(aasm_state: "canceling")
    redirect_to '/home/order_list', notice: "Your order canceling!"
  end

  def order_new
    @order = Order.new
    @product = Product.find_by(id: params[:product_id])
    session[:back_url] = request.url
  end

  def order_create
    @order = Order.new(order_params)
    if @order.save
      redirect_to payment_new_home_index_path(order_id: @order.id), notice: 'You successfully order this product, please choose payment method.'
    else
      redirect_to session[:back_url], notice: 'Please input your contact!'
    end
  end

  def payment_new
    order_id = params[:order_id]
    @order = Order.find(order_id)
    @product = @order.product
  end

  def payment_create
    order_id = params[:order_id]
    @order = Order.find(order_id)
    if @order.update(order_params)
      redirect_to "/home/ok"
    else
      redirect_to session[:back_url], notice: 'Please input your contact!'
    end
  end

  def comment_create
    content = params[:content]
    user_id = params[:user_id]
    product_id = params[:product_id]
    Comment.create!(user_id: user_id, product_id: product_id, content: content)
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:code, :product_id, :number, :amount, :user_id, :cv_code, :bank_code, :payment_method, :aasm_state, :contact)
    end
end
