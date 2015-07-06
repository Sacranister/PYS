require 'test_helper'

class DocumentoDeCobrosControllerTest < ActionController::TestCase
  setup do
    @documento_de_cobro = documento_de_cobros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:documento_de_cobros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create documento_de_cobro" do
    assert_difference('DocumentoDeCobro.count') do
      post :create, documento_de_cobro: { doc_cob_tipo: @documento_de_cobro.doc_cob_tipo, doc_com_cod: @documento_de_cobro.doc_com_cod, not_cre_cod: @documento_de_cobro.not_cre_cod }
    end

    assert_redirected_to documento_de_cobro_path(assigns(:documento_de_cobro))
  end

  test "should show documento_de_cobro" do
    get :show, id: @documento_de_cobro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @documento_de_cobro
    assert_response :success
  end

  test "should update documento_de_cobro" do
    patch :update, id: @documento_de_cobro, documento_de_cobro: { doc_cob_tipo: @documento_de_cobro.doc_cob_tipo, doc_com_cod: @documento_de_cobro.doc_com_cod, not_cre_cod: @documento_de_cobro.not_cre_cod }
    assert_redirected_to documento_de_cobro_path(assigns(:documento_de_cobro))
  end

  test "should destroy documento_de_cobro" do
    assert_difference('DocumentoDeCobro.count', -1) do
      delete :destroy, id: @documento_de_cobro
    end

    assert_redirected_to documento_de_cobros_path
  end
end
