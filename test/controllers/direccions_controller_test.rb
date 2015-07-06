require 'test_helper'

class DireccionsControllerTest < ActionController::TestCase
  setup do
    @direccion = direccions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:direccions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create direccion" do
    assert_difference('Direccion.count') do
      post :create, direccion: { cli_cod: @direccion.cli_cod, dir_calle: @direccion.dir_calle, dir_ciudad: @direccion.dir_ciudad, dir_comuna: @direccion.dir_comuna, dir_numero: @direccion.dir_numero, dir_tipo: @direccion.dir_tipo, guia_desp_cod: @direccion.guia_desp_cod }
    end

    assert_redirected_to direccion_path(assigns(:direccion))
  end

  test "should show direccion" do
    get :show, id: @direccion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @direccion
    assert_response :success
  end

  test "should update direccion" do
    patch :update, id: @direccion, direccion: { cli_cod: @direccion.cli_cod, dir_calle: @direccion.dir_calle, dir_ciudad: @direccion.dir_ciudad, dir_comuna: @direccion.dir_comuna, dir_numero: @direccion.dir_numero, dir_tipo: @direccion.dir_tipo, guia_desp_cod: @direccion.guia_desp_cod }
    assert_redirected_to direccion_path(assigns(:direccion))
  end

  test "should destroy direccion" do
    assert_difference('Direccion.count', -1) do
      delete :destroy, id: @direccion
    end

    assert_redirected_to direccions_path
  end
end
