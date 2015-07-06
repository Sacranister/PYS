require 'test_helper'

class PoliticasControllerTest < ActionController::TestCase
  test "should get despacho" do
    get :despacho
    assert_response :success
  end

  test "should get devolucion" do
    get :devolucion
    assert_response :success
  end

end
