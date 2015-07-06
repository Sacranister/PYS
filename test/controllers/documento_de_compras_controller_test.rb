require 'test_helper'

class DocumentoDeComprasControllerTest < ActionController::TestCase
  setup do
    @documento_de_compra = documento_de_compras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:documento_de_compras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create documento_de_compra" do
    assert_difference('DocumentoDeCompra.count') do
      post :create, documento_de_compra: { cli_cod: @documento_de_compra.cli_cod, doc_cob_cod: @documento_de_compra.doc_cob_cod, doc_com_fecha: @documento_de_compra.doc_com_fecha, doc_com_met_ent: @documento_de_compra.doc_com_met_ent, doc_com_met_pago: @documento_de_compra.doc_com_met_pago, doc_com_tipo: @documento_de_compra.doc_com_tipo, est_dc_cod: @documento_de_compra.est_dc_cod, guia_desp_cod: @documento_de_compra.guia_desp_cod, ven_cod: @documento_de_compra.ven_cod }
    end

    assert_redirected_to documento_de_compra_path(assigns(:documento_de_compra))
  end

  test "should show documento_de_compra" do
    get :show, id: @documento_de_compra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @documento_de_compra
    assert_response :success
  end

  test "should update documento_de_compra" do
    patch :update, id: @documento_de_compra, documento_de_compra: { cli_cod: @documento_de_compra.cli_cod, doc_cob_cod: @documento_de_compra.doc_cob_cod, doc_com_fecha: @documento_de_compra.doc_com_fecha, doc_com_met_ent: @documento_de_compra.doc_com_met_ent, doc_com_met_pago: @documento_de_compra.doc_com_met_pago, doc_com_tipo: @documento_de_compra.doc_com_tipo, est_dc_cod: @documento_de_compra.est_dc_cod, guia_desp_cod: @documento_de_compra.guia_desp_cod, ven_cod: @documento_de_compra.ven_cod }
    assert_redirected_to documento_de_compra_path(assigns(:documento_de_compra))
  end

  test "should destroy documento_de_compra" do
    assert_difference('DocumentoDeCompra.count', -1) do
      delete :destroy, id: @documento_de_compra
    end

    assert_redirected_to documento_de_compras_path
  end
end
