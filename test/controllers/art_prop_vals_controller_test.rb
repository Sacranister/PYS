require 'test_helper'

class ArtPropValsControllerTest < ActionController::TestCase
  setup do
    @art_prop_val = art_prop_vals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:art_prop_vals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create art_prop_val" do
    assert_difference('ArtPropVal.count') do
      post :create, art_prop_val: { art_cod: @art_prop_val.art_cod, prop_cod: @art_prop_val.prop_cod, val_cod: @art_prop_val.val_cod }
    end

    assert_redirected_to art_prop_val_path(assigns(:art_prop_val))
  end

  test "should show art_prop_val" do
    get :show, id: @art_prop_val
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @art_prop_val
    assert_response :success
  end

  test "should update art_prop_val" do
    patch :update, id: @art_prop_val, art_prop_val: { art_cod: @art_prop_val.art_cod, prop_cod: @art_prop_val.prop_cod, val_cod: @art_prop_val.val_cod }
    assert_redirected_to art_prop_val_path(assigns(:art_prop_val))
  end

  test "should destroy art_prop_val" do
    assert_difference('ArtPropVal.count', -1) do
      delete :destroy, id: @art_prop_val
    end

    assert_redirected_to art_prop_vals_path
  end
end
