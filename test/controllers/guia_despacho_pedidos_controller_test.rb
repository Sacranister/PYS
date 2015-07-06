require 'test_helper'

class GuiaDespachoPedidosControllerTest < ActionController::TestCase
  setup do
    @guia_despacho_pedido = guia_despacho_pedidos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guia_despacho_pedidos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create guia_despacho_pedido" do
    assert_difference('GuiaDespachoPedido.count') do
      post :create, guia_despacho_pedido: { guia_desp_ped_fecha: @guia_despacho_pedido.guia_desp_ped_fecha, ped_cod: @guia_despacho_pedido.ped_cod }
    end

    assert_redirected_to guia_despacho_pedido_path(assigns(:guia_despacho_pedido))
  end

  test "should show guia_despacho_pedido" do
    get :show, id: @guia_despacho_pedido
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @guia_despacho_pedido
    assert_response :success
  end

  test "should update guia_despacho_pedido" do
    patch :update, id: @guia_despacho_pedido, guia_despacho_pedido: { guia_desp_ped_fecha: @guia_despacho_pedido.guia_desp_ped_fecha, ped_cod: @guia_despacho_pedido.ped_cod }
    assert_redirected_to guia_despacho_pedido_path(assigns(:guia_despacho_pedido))
  end

  test "should destroy guia_despacho_pedido" do
    assert_difference('GuiaDespachoPedido.count', -1) do
      delete :destroy, id: @guia_despacho_pedido
    end

    assert_redirected_to guia_despacho_pedidos_path
  end
end
