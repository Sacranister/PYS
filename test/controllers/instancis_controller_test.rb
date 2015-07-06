require 'test_helper'

class InstancisControllerTest < ActionController::TestCase
  setup do
    @instanci = instancis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:instancis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create instanci" do
    assert_difference('Instanci.count') do
      post :create, instanci: { art_cod: @instanci.art_cod, est_art_cod: @instanci.est_art_cod, ins_cod: @instanci.ins_cod, ins_cod_prov: @instanci.ins_cod_prov, ins_precio_lista: @instanci.ins_precio_lista, ins_precio_prov: @instanci.ins_precio_prov, ins_stock: @instanci.ins_stock }
    end

    assert_redirected_to instanci_path(assigns(:instanci))
  end

  test "should show instanci" do
    get :show, id: @instanci
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @instanci
    assert_response :success
  end

  test "should update instanci" do
    patch :update, id: @instanci, instanci: { art_cod: @instanci.art_cod, est_art_cod: @instanci.est_art_cod, ins_cod: @instanci.ins_cod, ins_cod_prov: @instanci.ins_cod_prov, ins_precio_lista: @instanci.ins_precio_lista, ins_precio_prov: @instanci.ins_precio_prov, ins_stock: @instanci.ins_stock }
    assert_redirected_to instanci_path(assigns(:instanci))
  end

  test "should destroy instanci" do
    assert_difference('Instanci.count', -1) do
      delete :destroy, id: @instanci
    end

    assert_redirected_to instancis_path
  end
end
