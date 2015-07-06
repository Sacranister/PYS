require 'test_helper'

class CategorisControllerTest < ActionController::TestCase
  setup do
    @categori = categoris(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categoris)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create categori" do
    assert_difference('Categori.count') do
      post :create, categori: { cat_cat_cod: @categori.cat_cat_cod, cat_nom: @categori.cat_nom }
    end

    assert_redirected_to categori_path(assigns(:categori))
  end

  test "should show categori" do
    get :show, id: @categori
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @categori
    assert_response :success
  end

  test "should update categori" do
    patch :update, id: @categori, categori: { cat_cat_cod: @categori.cat_cat_cod, cat_nom: @categori.cat_nom }
    assert_redirected_to categori_path(assigns(:categori))
  end

  test "should destroy categori" do
    assert_difference('Categori.count', -1) do
      delete :destroy, id: @categori
    end

    assert_redirected_to categoris_path
  end
end
