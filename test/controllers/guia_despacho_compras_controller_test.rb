require 'test_helper'

class GuiaDespachoComprasControllerTest < ActionController::TestCase
  setup do
    @guia_despacho_compra = guia_despacho_compras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guia_despacho_compras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create guia_despacho_compra" do
    assert_difference('GuiaDespachoCompra.count') do
      post :create, guia_despacho_compra: { dir_cod: @guia_despacho_compra.dir_cod, doc_com_cod: @guia_despacho_compra.doc_com_cod, guia_desp_fecha: @guia_despacho_compra.guia_desp_fecha }
    end

    assert_redirected_to guia_despacho_compra_path(assigns(:guia_despacho_compra))
  end

  test "should show guia_despacho_compra" do
    get :show, id: @guia_despacho_compra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @guia_despacho_compra
    assert_response :success
  end

  test "should update guia_despacho_compra" do
    patch :update, id: @guia_despacho_compra, guia_despacho_compra: { dir_cod: @guia_despacho_compra.dir_cod, doc_com_cod: @guia_despacho_compra.doc_com_cod, guia_desp_fecha: @guia_despacho_compra.guia_desp_fecha }
    assert_redirected_to guia_despacho_compra_path(assigns(:guia_despacho_compra))
  end

  test "should destroy guia_despacho_compra" do
    assert_difference('GuiaDespachoCompra.count', -1) do
      delete :destroy, id: @guia_despacho_compra
    end

    assert_redirected_to guia_despacho_compras_path
  end
end
