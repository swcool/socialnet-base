require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
	title = assigns(:title)
    assert_equal "Register", title
    assert_response :success
    assert_template "new"
    #Test the form and all its tags
    assert_tag "form", :attributes => { :action => "/users", :method => "post" }
    assert_tag "input", :attributes => { :name => "user[name]", :type => "text", :size => 20, :maxlength => 40 }

  end

  test "should get create" do
    get :create
    assert_response :success
  end

  
end
