require 'test_helper'

class FeatureCategoriesControllerTest < ActionController::TestCase

  test "should create feature_category" do
    FeatureCategory.any_instance.expects(:save).returns(true)
    post :create, :feature_category => { }
    assert_response :redirect
  end

  test "should handle failure to create feature_category" do
    FeatureCategory.any_instance.expects(:save).returns(false)
    post :create, :feature_category => { }
    assert_template "new"
  end

  test "should destroy feature_category" do
    FeatureCategory.any_instance.expects(:destroy).returns(true)
    delete :destroy, :id => feature_categories(:one).to_param
    assert_not_nil flash[:notice]    
    assert_response :redirect
  end

  test "should handle failure to destroy feature_category" do
    FeatureCategory.any_instance.expects(:destroy).returns(false)    
    delete :destroy, :id => feature_categories(:one).to_param
    assert_not_nil flash[:error]
    assert_response :redirect
  end

  test "should get edit for feature_category" do
    get :edit, :id => feature_categories(:one).to_param
    assert_response :success
  end

  test "should get index for feature_categories" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feature_categories)
  end

  test "should get new for feature_category" do
    get :new
    assert_response :success
  end

  test "should get show for feature_category" do
    get :show, :id => feature_categories(:one).to_param
    assert_response :success
  end

  test "should update feature_category" do
    FeatureCategory.any_instance.expects(:save).returns(true)
    put :update, :id => feature_categories(:one).to_param, :feature_category => { }
    assert_response :redirect
  end

  test "should handle failure to update feature_category" do
    FeatureCategory.any_instance.expects(:save).returns(false)
    put :update, :id => feature_categories(:one).to_param, :feature_category => { }
    assert_template "edit"
  end

end