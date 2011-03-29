require 'test_helper'

class FabricsControllerTest < ActionController::TestCase

  test "should create fabric" do
    Fabric.any_instance.expects(:save).returns(true)
    post :create, :fabric => { }
    assert_response :redirect
  end

  test "should handle failure to create fabric" do
    Fabric.any_instance.expects(:save).returns(false)
    post :create, :fabric => { }
    assert_template "new"
  end

  test "should destroy fabric" do
    Fabric.any_instance.expects(:destroy).returns(true)
    delete :destroy, :id => fabrics(:one).to_param
    assert_not_nil flash[:notice]    
    assert_response :redirect
  end

  test "should handle failure to destroy fabric" do
    Fabric.any_instance.expects(:destroy).returns(false)    
    delete :destroy, :id => fabrics(:one).to_param
    assert_not_nil flash[:error]
    assert_response :redirect
  end

  test "should get edit for fabric" do
    get :edit, :id => fabrics(:one).to_param
    assert_response :success
  end

  test "should get index for fabrics" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fabrics)
  end

  test "should get new for fabric" do
    get :new
    assert_response :success
  end

  test "should get show for fabric" do
    get :show, :id => fabrics(:one).to_param
    assert_response :success
  end

  test "should update fabric" do
    Fabric.any_instance.expects(:save).returns(true)
    put :update, :id => fabrics(:one).to_param, :fabric => { }
    assert_response :redirect
  end

  test "should handle failure to update fabric" do
    Fabric.any_instance.expects(:save).returns(false)
    put :update, :id => fabrics(:one).to_param, :fabric => { }
    assert_template "edit"
  end

end