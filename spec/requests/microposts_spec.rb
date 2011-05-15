require 'spec_helper'

describe "Microposts" do
  before(:each) do
    user = Factory(:user)
    visit signin_path 
    fill_in :session_email,    :with => user.email
    fill_in :session_password, :with => user.password
    click_button :session_submit
  end
  
  describe "creation" do
    
    describe "failure" do
    
      it "should not make a new micropost" do
        lambda do
          visit root_path
          fill_in :micropost_content, :with => ""
          click_button :micropost_submit
          response.should render_template('site/index')
          response.should have_selector("div#errorExplanation")
        end.should_not change(Micropost, :count)
      end
    end

    describe "success" do
  
      it "should make a new micropost" do
        content = "Lorem ipsum dolor sit amet"
        lambda do
          visit root_path
          fill_in :micropost_content, :with => content
          click_button :micropost_submit
          response.should have_selector("span.content", :content => content)
        end.should change(Micropost, :count).by(1)
      end
    end
  end
end
