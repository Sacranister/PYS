require 'test_helper'

class EstadoArticulosControllerTest < ActionController::TestCase
  setup do
    @estado_articulo = estado_articulos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estado_articulos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estado_articulo" do
    assert_difference('EstadoArticulo.count') do
      post :create, estado_articulo: { est_art_nom: @estado_articulo.est_art_nom }
    end

    assert_redirected_to estado_articulo_path(assigns(:estado_articulo))
  end

  test "should show estado_articulo" do
    get :show, id: @estado_articulo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estado_articulo
    assert_response :success
  end

  test "should update estado_articulo" do
    patch :update, id: @estado_articulo, estado_articulo: { est_art_nom: @estado_articulo.est_art_nom }
    assert_redirected_to estado_articulo_path(assigns(:estado_articulo))
  end

  test "should destroy estado_articulo" do
    assert_difference('EstadoArticulo.count', -1) do
      delete :destroy, id: @estado_articulo
    end

    assert_redirected_to estado_articulos_path
  end
end
