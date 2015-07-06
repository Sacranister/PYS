require 'test_helper'

class EstadoDcsControllerTest < ActionController::TestCase
  setup do
    @estado_dc = estado_dcs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estado_dcs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estado_dc" do
    assert_difference('EstadoDc.count') do
      post :create, estado_dc: { est_dc_nom: @estado_dc.est_dc_nom }
    end

    assert_redirected_to estado_dc_path(assigns(:estado_dc))
  end

  test "should show estado_dc" do
    get :show, id: @estado_dc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estado_dc
    assert_response :success
  end

  test "should update estado_dc" do
    patch :update, id: @estado_dc, estado_dc: { est_dc_nom: @estado_dc.est_dc_nom }
    assert_redirected_to estado_dc_path(assigns(:estado_dc))
  end

  test "should destroy estado_dc" do
    assert_difference('EstadoDc.count', -1) do
      delete :destroy, id: @estado_dc
    end

    assert_redirected_to estado_dcs_path
  end
end
