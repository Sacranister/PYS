require 'test_helper'

class ArtPropsControllerTest < ActionController::TestCase
  setup do
    @art_prop = art_props(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:art_props)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create art_prop" do
    assert_difference('ArtProp.count') do
      post :create, art_prop: { art_cod: @art_prop.art_cod, prop_cod: @art_prop.prop_cod }
    end

    assert_redirected_to art_prop_path(assigns(:art_prop))
  end

  test "should show art_prop" do
    get :show, id: @art_prop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @art_prop
    assert_response :success
  end

  test "should update art_prop" do
    patch :update, id: @art_prop, art_prop: { art_cod: @art_prop.art_cod, prop_cod: @art_prop.prop_cod }
    assert_redirected_to art_prop_path(assigns(:art_prop))
  end

  test "should destroy art_prop" do
    assert_difference('ArtProp.count', -1) do
      delete :destroy, id: @art_prop
    end

    assert_redirected_to art_props_path
  end
end
