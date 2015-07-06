require 'test_helper'

class HistorialEstadoPedidosControllerTest < ActionController::TestCase
  setup do
    @historial_estado_pedido = historial_estado_pedidos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historial_estado_pedidos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historial_estado_pedido" do
    assert_difference('HistorialEstadoPedido.count') do
      post :create, historial_estado_pedido: { estado_ped_cod: @historial_estado_pedido.estado_ped_cod, hist_est_ped_cod: @historial_estado_pedido.hist_est_ped_cod, hist_est_ped_fecha: @historial_estado_pedido.hist_est_ped_fecha, ped_cod: @historial_estado_pedido.ped_cod }
    end

    assert_redirected_to historial_estado_pedido_path(assigns(:historial_estado_pedido))
  end

  test "should show historial_estado_pedido" do
    get :show, id: @historial_estado_pedido
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @historial_estado_pedido
    assert_response :success
  end

  test "should update historial_estado_pedido" do
    patch :update, id: @historial_estado_pedido, historial_estado_pedido: { estado_ped_cod: @historial_estado_pedido.estado_ped_cod, hist_est_ped_cod: @historial_estado_pedido.hist_est_ped_cod, hist_est_ped_fecha: @historial_estado_pedido.hist_est_ped_fecha, ped_cod: @historial_estado_pedido.ped_cod }
    assert_redirected_to historial_estado_pedido_path(assigns(:historial_estado_pedido))
  end

  test "should destroy historial_estado_pedido" do
    assert_difference('HistorialEstadoPedido.count', -1) do
      delete :destroy, id: @historial_estado_pedido
    end

    assert_redirected_to historial_estado_pedidos_path
  end
end
