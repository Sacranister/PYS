require 'test_helper'

class TransicionEstadoDcsControllerTest < ActionController::TestCase
  setup do
    @transicion_estado_dc = transicion_estado_dcs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transicion_estado_dcs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transicion_estado_dc" do
    assert_difference('TransicionEstadoDc.count') do
      post :create, transicion_estado_dc: { est_dc_cod: @transicion_estado_dc.est_dc_cod, est_est_dc_cod: @transicion_estado_dc.est_est_dc_cod, trans_est_dc_cod: @transicion_estado_dc.trans_est_dc_cod }
    end

    assert_redirected_to transicion_estado_dc_path(assigns(:transicion_estado_dc))
  end

  test "should show transicion_estado_dc" do
    get :show, id: @transicion_estado_dc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transicion_estado_dc
    assert_response :success
  end

  test "should update transicion_estado_dc" do
    patch :update, id: @transicion_estado_dc, transicion_estado_dc: { est_dc_cod: @transicion_estado_dc.est_dc_cod, est_est_dc_cod: @transicion_estado_dc.est_est_dc_cod, trans_est_dc_cod: @transicion_estado_dc.trans_est_dc_cod }
    assert_redirected_to transicion_estado_dc_path(assigns(:transicion_estado_dc))
  end

  test "should destroy transicion_estado_dc" do
    assert_difference('TransicionEstadoDc.count', -1) do
      delete :destroy, id: @transicion_estado_dc
    end

    assert_redirected_to transicion_estado_dcs_path
  end
end
