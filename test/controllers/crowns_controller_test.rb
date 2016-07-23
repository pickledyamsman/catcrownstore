require 'test_helper'

class CrownsControllerTest < ActionController::TestCase
  setup do
    @crown = crowns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crowns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crown" do
    assert_difference('Crown.count') do
      post :create, crown: { color: @crown.color, description: @crown.description, flower_type: @crown.flower_type, name: @crown.name, price: @crown.price }
    end

    assert_redirected_to crown_path(assigns(:crown))
  end

  test "should show crown" do
    get :show, id: @crown
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @crown
    assert_response :success
  end

  test "should update crown" do
    patch :update, id: @crown, crown: { color: @crown.color, description: @crown.description, flower_type: @crown.flower_type, name: @crown.name, price: @crown.price }
    assert_redirected_to crown_path(assigns(:crown))
  end

  test "should destroy crown" do
    assert_difference('Crown.count', -1) do
      delete :destroy, id: @crown
    end

    assert_redirected_to crowns_path
  end
end
