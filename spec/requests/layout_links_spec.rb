require 'spec_helper'

describe "LayoutLinks" do
  it "should have a Home page at '/'" do
	get '/'
	response.should have_selector('title', :content => "Welcome to Base Social Network!")
  end

  it "should have a About page at '/about'" do
	get '/about'
	response.should have_selector('title', :content => "About Base Social Network")
  end

  it "should have a Help page at '/help'" do
	get '/help'
	response.should have_selector('title', :content => "Base Social Network Help")
  end
 
  describe "when not signed in" do
    it "should have a signin link" do
      visit root_path
      response.should have_selector("a", :href => "/signin?locale=en",
                                         :content => "Sign in")
    end
  end

  describe "when signed in" do

    before(:each) do
      @user = Factory(:user)
      visit signin_path
      fill_in :session_email,    :with => @user.email
      fill_in :session_password, :with => @user.password
      click_button :session_submit
    end

    it "should have a signout link" do
      visit root_path
      response.should have_selector("a", :href => '/signout?locale=en',
                                         :content => "Sign out")
    end

    it "should have a user link" do
      visit root_path 
      response.should have_selector("a", :href => '/users?locale=en',
                                         :content => "Users")
    end
  end
end
