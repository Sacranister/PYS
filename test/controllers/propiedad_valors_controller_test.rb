require 'test_helper'

class PropiedadValorsControllerTest < ActionController::TestCase
  setup do
    @propiedad_valor = propiedad_valors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:propiedad_valors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create propiedad_valor" do
    assert_difference('PropiedadValor.count') do
      post :create, propiedad_valor: { prop_cod: @propiedad_valor.prop_cod, val_cod: @propiedad_valor.val_cod }
    end

    assert_redirected_to propiedad_valor_path(assigns(:propiedad_valor))
  end

  test "should show propiedad_valor" do
    get :show, id: @propiedad_valor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @propiedad_valor
    assert_response :success
  end

  test "should update propiedad_valor" do
    patch :update, id: @propiedad_valor, propiedad_valor: { prop_cod: @propiedad_valor.prop_cod, val_cod: @propiedad_valor.val_cod }
    assert_redirected_to propiedad_valor_path(assigns(:propiedad_valor))
  end

  test "should destroy propiedad_valor" do
    assert_difference('PropiedadValor.count', -1) do
      delete :destroy, id: @propiedad_valor
    end

    assert_redirected_to propiedad_valors_path
  end
end
