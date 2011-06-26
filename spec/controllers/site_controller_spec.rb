require 'spec_helper'

describe SiteController do
  render_views

  describe "GET 'index'" do
    describe "when not signed in" do
	  before(:each) do
	    get :index
      end

	  it "should be successful" do
	    get 'index'
	    response.should be_success
	  end
      it "should have the right title" do
	    get 'index'
	    response.should have_selector("title",
						:content => "Welcome to Base Social Network!")
      end
    end

    describe "when signed in" do

      before(:each) do
        @user = test_sign_in(Factory(:user))
        other_user = Factory(:user, :name => Factory.next(:name), :email => Factory.next(:email))
        other_user.follow!(@user)
      end

      it "should have the right follower/following counts" do
        get :index
        response.should have_selector("a", :href => following_user_path(@user),
                                           :content => "0 following")
        response.should have_selector("a", :href => followers_user_path(@user),
                                           :content => "1 follower")
      end
    end
  end
  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
  end

  describe "GET 'help'" do
    it "should be successful" do
      get 'help'
      response.should be_success
    end
  end

  
end
