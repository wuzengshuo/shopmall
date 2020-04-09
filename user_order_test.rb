require 'test_helper'

class UserOrderTest < ActionDispatch::IntegrationTest
  setup { sign_in_as 'one' }
  setup do
    @user1 = users(:one)
    @product = products(:one)
  end
  # login user order
  test "login user1 order" do
    get order_new_home_index_url, params: {product_id: @product.id}
    assert_response :success
    assert_difference('Order.count') do
      post order_create_home_index_url, params: {order: {product_id: @product.id, amount: @product.price, user_id: @user1.id, contact: @user1.email}}
    end
    assert_equal @user1.orders.count, 1
  end

   # unlogin user order
   test "unlogin order" do
    get order_new_home_index_url, params: {product_id: @product.id}
    assert_response :success
    assert_difference('Order.count') do
      post order_create_home_index_url, params: {order: {product_id: @product.id, amount: @product.price, contact: "a@qq.com"}}
    end
  end

end
