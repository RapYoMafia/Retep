require 'test_helper'

class FeaturesControllerTest < ActionController::TestCase

  test "should create feature" do
    Feature.any_instance.expects(:save).returns(true)
    post :create, :feature => { }
    assert_response :redirect
  end

  test "should handle failure to create feature" do
    Feature.any_instance.expects(:save).returns(false)
    post :create, :feature => { }
    assert_template "new"
  end

  test "should destroy feature" do
    Feature.any_instance.expects(:destroy).returns(true)
    delete :destroy, :id => features(:one).to_param
    assert_not_nil flash[:notice]    
    assert_response :redirect
  end

  test "should handle failure to destroy feature" do
    Feature.any_instance.expects(:destroy).returns(false)    
    delete :destroy, :id => features(:one).to_param
    assert_not_nil flash[:error]
    assert_response :redirect
  end

  test "should get edit for feature" do
    get :edit, :id => features(:one).to_param
    assert_response :success
  end

  test "should get index for features" do
    get :index
    assert_response :success
    assert_not_nil assigns(:features)
  end

  test "should get new for feature" do
    get :new
    assert_response :success
  end

  test "should get show for feature" do
    get :show, :id => features(:one).to_param
    assert_response :success
  end

  test "should update feature" do
    Feature.any_instance.expects(:save).returns(true)
    put :update, :id => features(:one).to_param, :feature => { }
    assert_response :redirect
  end

  test "should handle failure to update feature" do
    Feature.any_instance.expects(:save).returns(false)
    put :update, :id => features(:one).to_param, :feature => { }
    assert_template "edit"
  end

end