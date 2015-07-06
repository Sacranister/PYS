require 'test_helper'

class DetalleSolDevolucionsControllerTest < ActionController::TestCase
  setup do
    @detalle_sol_devolucion = detalle_sol_devolucions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detalle_sol_devolucions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detalle_sol_devolucion" do
    assert_difference('DetalleSolDevolucion.count') do
      post :create, detalle_sol_devolucion: { det_sol_dev_cant: @detalle_sol_devolucion.det_sol_dev_cant, det_sol_dev_linea: @detalle_sol_devolucion.det_sol_dev_linea, det_sol_dev_precio: @detalle_sol_devolucion.det_sol_dev_precio, ins_cod: @detalle_sol_devolucion.ins_cod, ins_cod_prov: @detalle_sol_devolucion.ins_cod_prov, sol_dev_cod: @detalle_sol_devolucion.sol_dev_cod }
    end

    assert_redirected_to detalle_sol_devolucion_path(assigns(:detalle_sol_devolucion))
  end

  test "should show detalle_sol_devolucion" do
    get :show, id: @detalle_sol_devolucion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detalle_sol_devolucion
    assert_response :success
  end

  test "should update detalle_sol_devolucion" do
    patch :update, id: @detalle_sol_devolucion, detalle_sol_devolucion: { det_sol_dev_cant: @detalle_sol_devolucion.det_sol_dev_cant, det_sol_dev_linea: @detalle_sol_devolucion.det_sol_dev_linea, det_sol_dev_precio: @detalle_sol_devolucion.det_sol_dev_precio, ins_cod: @detalle_sol_devolucion.ins_cod, ins_cod_prov: @detalle_sol_devolucion.ins_cod_prov, sol_dev_cod: @detalle_sol_devolucion.sol_dev_cod }
    assert_redirected_to detalle_sol_devolucion_path(assigns(:detalle_sol_devolucion))
  end

  test "should destroy detalle_sol_devolucion" do
    assert_difference('DetalleSolDevolucion.count', -1) do
      delete :destroy, id: @detalle_sol_devolucion
    end

    assert_redirected_to detalle_sol_devolucions_path
  end
end
