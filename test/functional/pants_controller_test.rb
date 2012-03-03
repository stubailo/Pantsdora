require 'test_helper'

class PantsControllerTest < ActionController::TestCase
  setup do
    @pant = pants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pant" do
    assert_difference('Pant.count') do
      post :create, pant: @pant.attributes
    end

    assert_redirected_to pant_path(assigns(:pant))
  end

  test "should show pant" do
    get :show, id: @pant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pant
    assert_response :success
  end

  test "should update pant" do
    put :update, id: @pant, pant: @pant.attributes
    assert_redirected_to pant_path(assigns(:pant))
  end

  test "should destroy pant" do
    assert_difference('Pant.count', -1) do
      delete :destroy, id: @pant
    end

    assert_redirected_to pants_path
  end
end
