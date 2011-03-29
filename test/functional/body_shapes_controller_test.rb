require 'test_helper'

class BodyShapesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:body_shapes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create body_shape" do
    assert_difference('BodyShape.count') do
      post :create, :body_shape => { }
    end

    assert_redirected_to body_shape_path(assigns(:body_shape))
  end

  test "should show body_shape" do
    get :show, :id => body_shapes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => body_shapes(:one).to_param
    assert_response :success
  end

  test "should update body_shape" do
    put :update, :id => body_shapes(:one).to_param, :body_shape => { }
    assert_redirected_to body_shape_path(assigns(:body_shape))
  end

  test "should destroy body_shape" do
    assert_difference('BodyShape.count', -1) do
      delete :destroy, :id => body_shapes(:one).to_param
    end

    assert_redirected_to body_shapes_path
  end
end
