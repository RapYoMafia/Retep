require 'test_helper'

class StylesControllerTest < ActionController::TestCase

  test "should create style" do
    Style.any_instance.expects(:save).returns(true)
    post :create, :style => { }
    assert_response :redirect
  end

  test "should handle failure to create style" do
    Style.any_instance.expects(:save).returns(false)
    post :create, :style => { }
    assert_template "new"
  end

  test "should destroy style" do
    Style.any_instance.expects(:destroy).returns(true)
    delete :destroy, :id => styles(:one).to_param
    assert_not_nil flash[:notice]    
    assert_response :redirect
  end

  test "should handle failure to destroy style" do
    Style.any_instance.expects(:destroy).returns(false)    
    delete :destroy, :id => styles(:one).to_param
    assert_not_nil flash[:error]
    assert_response :redirect
  end

  test "should get edit for style" do
    get :edit, :id => styles(:one).to_param
    assert_response :success
  end

  test "should get index for styles" do
    get :index
    assert_response :success
    assert_not_nil assigns(:styles)
  end

  test "should get new for style" do
    get :new
    assert_response :success
  end

  test "should get show for style" do
    get :show, :id => styles(:one).to_param
    assert_response :success
  end

  test "should update style" do
    Style.any_instance.expects(:save).returns(true)
    put :update, :id => styles(:one).to_param, :style => { }
    assert_response :redirect
  end

  test "should handle failure to update style" do
    Style.any_instance.expects(:save).returns(false)
    put :update, :id => styles(:one).to_param, :style => { }
    assert_template "edit"
  end

end