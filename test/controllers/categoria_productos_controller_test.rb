require 'test_helper'

class CategoriaProductosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categoria_producto = categoria_productos(:one)
  end

  test "should get index" do
    get categoria_productos_url, as: :json
    assert_response :success
  end

  test "should create categoria_producto" do
    assert_difference('CategoriaProducto.count') do
      post categoria_productos_url, params: { categoria_producto: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show categoria_producto" do
    get categoria_producto_url(@categoria_producto), as: :json
    assert_response :success
  end

  test "should update categoria_producto" do
    patch categoria_producto_url(@categoria_producto), params: { categoria_producto: {  } }, as: :json
    assert_response 200
  end

  test "should destroy categoria_producto" do
    assert_difference('CategoriaProducto.count', -1) do
      delete categoria_producto_url(@categoria_producto), as: :json
    end

    assert_response 204
  end
end
