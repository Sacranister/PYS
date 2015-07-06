require 'test_helper'

class TransicionEstadoArtsControllerTest < ActionController::TestCase
  setup do
    @transicion_estado_art = transicion_estado_arts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transicion_estado_arts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transicion_estado_art" do
    assert_difference('TransicionEstadoArt.count') do
      post :create, transicion_estado_art: { est_art_cod: @transicion_estado_art.est_art_cod, est_est_art_cod: @transicion_estado_art.est_est_art_cod, trans_est_art_cod: @transicion_estado_art.trans_est_art_cod }
    end

    assert_redirected_to transicion_estado_art_path(assigns(:transicion_estado_art))
  end

  test "should show transicion_estado_art" do
    get :show, id: @transicion_estado_art
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transicion_estado_art
    assert_response :success
  end

  test "should update transicion_estado_art" do
    patch :update, id: @transicion_estado_art, transicion_estado_art: { est_art_cod: @transicion_estado_art.est_art_cod, est_est_art_cod: @transicion_estado_art.est_est_art_cod, trans_est_art_cod: @transicion_estado_art.trans_est_art_cod }
    assert_redirected_to transicion_estado_art_path(assigns(:transicion_estado_art))
  end

  test "should destroy transicion_estado_art" do
    assert_difference('TransicionEstadoArt.count', -1) do
      delete :destroy, id: @transicion_estado_art
    end

    assert_redirected_to transicion_estado_arts_path
  end
end
