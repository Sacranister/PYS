require 'test_helper'

class DetalleDocumentoDeComprasControllerTest < ActionController::TestCase
  setup do
    @detalle_documento_de_compra = detalle_documento_de_compras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detalle_documento_de_compras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detalle_documento_de_compra" do
    assert_difference('DetalleDocumentoDeCompra.count') do
      post :create, detalle_documento_de_compra: { det_doc_com_cant: @detalle_documento_de_compra.det_doc_com_cant, det_doc_com_linea: @detalle_documento_de_compra.det_doc_com_linea, det_doc_com_precio: @detalle_documento_de_compra.det_doc_com_precio, det_doc_com_precio_uni: @detalle_documento_de_compra.det_doc_com_precio_uni, doc_com_cod: @detalle_documento_de_compra.doc_com_cod, ins_cod: @detalle_documento_de_compra.ins_cod, ins_cod_prov: @detalle_documento_de_compra.ins_cod_prov }
    end

    assert_redirected_to detalle_documento_de_compra_path(assigns(:detalle_documento_de_compra))
  end

  test "should show detalle_documento_de_compra" do
    get :show, id: @detalle_documento_de_compra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detalle_documento_de_compra
    assert_response :success
  end

  test "should update detalle_documento_de_compra" do
    patch :update, id: @detalle_documento_de_compra, detalle_documento_de_compra: { det_doc_com_cant: @detalle_documento_de_compra.det_doc_com_cant, det_doc_com_linea: @detalle_documento_de_compra.det_doc_com_linea, det_doc_com_precio: @detalle_documento_de_compra.det_doc_com_precio, det_doc_com_precio_uni: @detalle_documento_de_compra.det_doc_com_precio_uni, doc_com_cod: @detalle_documento_de_compra.doc_com_cod, ins_cod: @detalle_documento_de_compra.ins_cod, ins_cod_prov: @detalle_documento_de_compra.ins_cod_prov }
    assert_redirected_to detalle_documento_de_compra_path(assigns(:detalle_documento_de_compra))
  end

  test "should destroy detalle_documento_de_compra" do
    assert_difference('DetalleDocumentoDeCompra.count', -1) do
      delete :destroy, id: @detalle_documento_de_compra
    end

    assert_redirected_to detalle_documento_de_compras_path
  end
end
