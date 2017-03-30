require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = FactoryGirl.create(:user)
  end

  test "first_and_last_name returns the capitalized first name and last name" do
    assert_equal "Romu Escande", @user.first_and_last_name
  end

  test "invalid without an email" do
    @user.email = nil
    assert_presence(@user, :email)
  end
end
