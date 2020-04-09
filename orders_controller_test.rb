require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup { sign_in_as 'one' }
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

end
