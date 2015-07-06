require 'test_helper'

class HistorialEstadoDcsControllerTest < ActionController::TestCase
  setup do
    @historial_estado_dc = historial_estado_dcs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historial_estado_dcs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historial_estado_dc" do
    assert_difference('HistorialEstadoDc.count') do
      post :create, historial_estado_dc: { doc_com_cod: @historial_estado_dc.doc_com_cod, est_dc_cod: @historial_estado_dc.est_dc_cod, hist_est_dc_cod: @historial_estado_dc.hist_est_dc_cod, hist_est_dc_fecha: @historial_estado_dc.hist_est_dc_fecha }
    end

    assert_redirected_to historial_estado_dc_path(assigns(:historial_estado_dc))
  end

  test "should show historial_estado_dc" do
    get :show, id: @historial_estado_dc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @historial_estado_dc
    assert_response :success
  end

  test "should update historial_estado_dc" do
    patch :update, id: @historial_estado_dc, historial_estado_dc: { doc_com_cod: @historial_estado_dc.doc_com_cod, est_dc_cod: @historial_estado_dc.est_dc_cod, hist_est_dc_cod: @historial_estado_dc.hist_est_dc_cod, hist_est_dc_fecha: @historial_estado_dc.hist_est_dc_fecha }
    assert_redirected_to historial_estado_dc_path(assigns(:historial_estado_dc))
  end

  test "should destroy historial_estado_dc" do
    assert_difference('HistorialEstadoDc.count', -1) do
      delete :destroy, id: @historial_estado_dc
    end

    assert_redirected_to historial_estado_dcs_path
  end
end
