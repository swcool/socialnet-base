require 'test_helper'

class SiteControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    title = assigns(:title)
    assert_equal "Welcome to Base Social Network!", title
    assert_response :success
    assert_template "index"
  end

  test "should get about" do
    get :about
    title = assigns(:title)
    assert_equal "About Base Social Network", title
    assert_response :success
    assert_template "about"
  end

  test "should get help" do
    get :help
	title = assigns(:title)
    assert_equal "Base Social Network Help", title
    assert_response :success
    assert_template "help"
  end

end
