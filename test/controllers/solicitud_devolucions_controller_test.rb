require 'test_helper'

class SolicitudDevolucionsControllerTest < ActionController::TestCase
  setup do
    @solicitud_devolucion = solicitud_devolucions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:solicitud_devolucions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create solicitud_devolucion" do
    assert_difference('SolicitudDevolucion.count') do
      post :create, solicitud_devolucion: { cli_cod: @solicitud_devolucion.cli_cod, doc_com_cod: @solicitud_devolucion.doc_com_cod, not_cre_cod: @solicitud_devolucion.not_cre_cod, sol_dev_comentario: @solicitud_devolucion.sol_dev_comentario, sol_dev_est: @solicitud_devolucion.sol_dev_est, ven_cod: @solicitud_devolucion.ven_cod }
    end

    assert_redirected_to solicitud_devolucion_path(assigns(:solicitud_devolucion))
  end

  test "should show solicitud_devolucion" do
    get :show, id: @solicitud_devolucion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @solicitud_devolucion
    assert_response :success
  end

  test "should update solicitud_devolucion" do
    patch :update, id: @solicitud_devolucion, solicitud_devolucion: { cli_cod: @solicitud_devolucion.cli_cod, doc_com_cod: @solicitud_devolucion.doc_com_cod, not_cre_cod: @solicitud_devolucion.not_cre_cod, sol_dev_comentario: @solicitud_devolucion.sol_dev_comentario, sol_dev_est: @solicitud_devolucion.sol_dev_est, ven_cod: @solicitud_devolucion.ven_cod }
    assert_redirected_to solicitud_devolucion_path(assigns(:solicitud_devolucion))
  end

  test "should destroy solicitud_devolucion" do
    assert_difference('SolicitudDevolucion.count', -1) do
      delete :destroy, id: @solicitud_devolucion
    end

    assert_redirected_to solicitud_devolucions_path
  end
end
