require 'test_helper'

class ShouldersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shoulders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shoulder" do
    assert_difference('Shoulder.count') do
      post :create, :shoulder => { }
    end

    assert_redirected_to shoulder_path(assigns(:shoulder))
  end

  test "should show shoulder" do
    get :show, :id => shoulders(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => shoulders(:one).to_param
    assert_response :success
  end

  test "should update shoulder" do
    put :update, :id => shoulders(:one).to_param, :shoulder => { }
    assert_redirected_to shoulder_path(assigns(:shoulder))
  end

  test "should destroy shoulder" do
    assert_difference('Shoulder.count', -1) do
      delete :destroy, :id => shoulders(:one).to_param
    end

    assert_redirected_to shoulders_path
  end
end
