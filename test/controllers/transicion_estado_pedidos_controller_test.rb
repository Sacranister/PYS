require 'test_helper'

class TransicionEstadoPedidosControllerTest < ActionController::TestCase
  setup do
    @transicion_estado_pedido = transicion_estado_pedidos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transicion_estado_pedidos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transicion_estado_pedido" do
    assert_difference('TransicionEstadoPedido.count') do
      post :create, transicion_estado_pedido: { est_estado_ped_cod: @transicion_estado_pedido.est_estado_ped_cod, estado_ped_cod: @transicion_estado_pedido.estado_ped_cod, trans_est_ped_cod: @transicion_estado_pedido.trans_est_ped_cod }
    end

    assert_redirected_to transicion_estado_pedido_path(assigns(:transicion_estado_pedido))
  end

  test "should show transicion_estado_pedido" do
    get :show, id: @transicion_estado_pedido
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transicion_estado_pedido
    assert_response :success
  end

  test "should update transicion_estado_pedido" do
    patch :update, id: @transicion_estado_pedido, transicion_estado_pedido: { est_estado_ped_cod: @transicion_estado_pedido.est_estado_ped_cod, estado_ped_cod: @transicion_estado_pedido.estado_ped_cod, trans_est_ped_cod: @transicion_estado_pedido.trans_est_ped_cod }
    assert_redirected_to transicion_estado_pedido_path(assigns(:transicion_estado_pedido))
  end

  test "should destroy transicion_estado_pedido" do
    assert_difference('TransicionEstadoPedido.count', -1) do
      delete :destroy, id: @transicion_estado_pedido
    end

    assert_redirected_to transicion_estado_pedidos_path
  end
end
