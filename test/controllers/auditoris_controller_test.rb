require 'test_helper'

class AuditorisControllerTest < ActionController::TestCase
  setup do
    @auditori = auditoris(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:auditoris)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create auditori" do
    assert_difference('Auditori.count') do
      post :create, auditori: { aud_antes: @auditori.aud_antes, aud_atri_modif: @auditori.aud_atri_modif, aud_despues: @auditori.aud_despues, aud_fecha: @auditori.aud_fecha, aud_operacion: @auditori.aud_operacion, aud_tabla_modif: @auditori.aud_tabla_modif, aud_usuario: @auditori.aud_usuario }
    end

    assert_redirected_to auditori_path(assigns(:auditori))
  end

  test "should show auditori" do
    get :show, id: @auditori
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @auditori
    assert_response :success
  end

  test "should update auditori" do
    patch :update, id: @auditori, auditori: { aud_antes: @auditori.aud_antes, aud_atri_modif: @auditori.aud_atri_modif, aud_despues: @auditori.aud_despues, aud_fecha: @auditori.aud_fecha, aud_operacion: @auditori.aud_operacion, aud_tabla_modif: @auditori.aud_tabla_modif, aud_usuario: @auditori.aud_usuario }
    assert_redirected_to auditori_path(assigns(:auditori))
  end

  test "should destroy auditori" do
    assert_difference('Auditori.count', -1) do
      delete :destroy, id: @auditori
    end

    assert_redirected_to auditoris_path
  end
end
