require 'test_helper'

class ColorsControllerTest < ActionController::TestCase

  test "should create color" do
    Color.any_instance.expects(:save).returns(true)
    post :create, :color => { }
    assert_response :redirect
  end

  test "should handle failure to create color" do
    Color.any_instance.expects(:save).returns(false)
    post :create, :color => { }
    assert_template "new"
  end

  test "should destroy color" do
    Color.any_instance.expects(:destroy).returns(true)
    delete :destroy, :id => colors(:one).to_param
    assert_not_nil flash[:notice]    
    assert_response :redirect
  end

  test "should handle failure to destroy color" do
    Color.any_instance.expects(:destroy).returns(false)    
    delete :destroy, :id => colors(:one).to_param
    assert_not_nil flash[:error]
    assert_response :redirect
  end

  test "should get edit for color" do
    get :edit, :id => colors(:one).to_param
    assert_response :success
  end

  test "should get index for colors" do
    get :index
    assert_response :success
    assert_not_nil assigns(:colors)
  end

  test "should get new for color" do
    get :new
    assert_response :success
  end

  test "should get show for color" do
    get :show, :id => colors(:one).to_param
    assert_response :success
  end

  test "should update color" do
    Color.any_instance.expects(:save).returns(true)
    put :update, :id => colors(:one).to_param, :color => { }
    assert_response :redirect
  end

  test "should handle failure to update color" do
    Color.any_instance.expects(:save).returns(false)
    put :update, :id => colors(:one).to_param, :color => { }
    assert_template "edit"
  end

end