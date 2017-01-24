require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "first_and_last_name returns the capitalized first name and last name" do
    user = User.new(first_name: "john", last_name: "lennon")
    assert_equal "John Lennon", user.first_and_last_name
  end
end


