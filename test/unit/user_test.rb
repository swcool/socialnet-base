require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should create user" do
	user = User.new

	user.name = "testabc1"
	user.email       = "testabc1@testabc.com"
	user.password    = "testabc1"
    user.password_confirmation = "testabc1"

    assert user.save
  end

  test "should find user" do
	user_id = users(:testabc1).id
	assert_nothing_raised { User.find(user_id) }
  end

  test "should not create a user with name" do
	user = User.new
    user.email = "abcde@abcde.com"
    user.password = "abcde"
    assert !user.valid?
    assert user.errors[:name].any?
	assert !user.save
  end

  test "should be a valid user" do
	assert users(:valid_user).valid?
  end

  test "should not be a valid user" do
	assert !users(:invalid_user).valid?
  end

  test "screen name is too short" do
    user = User.new
	user.name = "aaa" 
    assert !user.valid?, "#{user.name} should raise a minimum length error"
  end
end
