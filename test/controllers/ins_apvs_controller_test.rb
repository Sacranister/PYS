require 'test_helper'

class InsApvsControllerTest < ActionController::TestCase
  setup do
    @ins_apv = ins_apvs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ins_apvs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ins_apv" do
    assert_difference('InsApv.count') do
      post :create, ins_apv: { apv_cod: @ins_apv.apv_cod, ins_cod: @ins_apv.ins_cod, ins_cod_prov: @ins_apv.ins_cod_prov }
    end

    assert_redirected_to ins_apv_path(assigns(:ins_apv))
  end

  test "should show ins_apv" do
    get :show, id: @ins_apv
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ins_apv
    assert_response :success
  end

  test "should update ins_apv" do
    patch :update, id: @ins_apv, ins_apv: { apv_cod: @ins_apv.apv_cod, ins_cod: @ins_apv.ins_cod, ins_cod_prov: @ins_apv.ins_cod_prov }
    assert_redirected_to ins_apv_path(assigns(:ins_apv))
  end

  test "should destroy ins_apv" do
    assert_difference('InsApv.count', -1) do
      delete :destroy, id: @ins_apv
    end

    assert_redirected_to ins_apvs_path
  end
end
