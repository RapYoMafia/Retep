require 'test_helper'

class ChestsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chest" do
    assert_difference('Chest.count') do
      post :create, :chest => { }
    end

    assert_redirected_to chest_path(assigns(:chest))
  end

  test "should show chest" do
    get :show, :id => chests(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => chests(:one).to_param
    assert_response :success
  end

  test "should update chest" do
    put :update, :id => chests(:one).to_param, :chest => { }
    assert_redirected_to chest_path(assigns(:chest))
  end

  test "should destroy chest" do
    assert_difference('Chest.count', -1) do
      delete :destroy, :id => chests(:one).to_param
    end

    assert_redirected_to chests_path
  end
end
