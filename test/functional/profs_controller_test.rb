require 'test_helper'

class ProfsControllerTest < ActionController::TestCase
  setup do
    @prof = profs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prof" do
    assert_difference('Prof.count') do
      post :create, prof: @prof.attributes
    end

    assert_redirected_to prof_path(assigns(:prof))
  end

  test "should show prof" do
    get :show, id: @prof.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prof.to_param
    assert_response :success
  end

  test "should update prof" do
    put :update, id: @prof.to_param, prof: @prof.attributes
    assert_redirected_to prof_path(assigns(:prof))
  end

  test "should destroy prof" do
    assert_difference('Prof.count', -1) do
      delete :destroy, id: @prof.to_param
    end

    assert_redirected_to profs_path
  end
end
