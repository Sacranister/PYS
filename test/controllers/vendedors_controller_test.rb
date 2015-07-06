require 'test_helper'

class VendedorsControllerTest < ActionController::TestCase
  setup do
    @vendedor = vendedors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vendedors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vendedor" do
    assert_difference('Vendedor.count') do
      post :create, vendedor: { ven_mail: @vendedor.ven_mail, ven_nom: @vendedor.ven_nom, ven_rut: @vendedor.ven_rut, ven_tel: @vendedor.ven_tel }
    end

    assert_redirected_to vendedor_path(assigns(:vendedor))
  end

  test "should show vendedor" do
    get :show, id: @vendedor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vendedor
    assert_response :success
  end

  test "should update vendedor" do
    patch :update, id: @vendedor, vendedor: { ven_mail: @vendedor.ven_mail, ven_nom: @vendedor.ven_nom, ven_rut: @vendedor.ven_rut, ven_tel: @vendedor.ven_tel }
    assert_redirected_to vendedor_path(assigns(:vendedor))
  end

  test "should destroy vendedor" do
    assert_difference('Vendedor.count', -1) do
      delete :destroy, id: @vendedor
    end

    assert_redirected_to vendedors_path
  end
end
