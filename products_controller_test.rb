require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup { sign_in_as 'one' }
  setup do
    @product = products(:one)
    @product_category = product_categories(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { description: @product.description, name: @product.name, number: @product.number, on_shelf: @product.on_shelf, price: @product.price, product_category_id: @product_category.id } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { description: @product.description, name: @product.name, number: @product.number, on_shelf: @product.on_shelf, price: @product.price, product_category_id: @product_category.id } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
