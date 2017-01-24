require 'test_helper'

class HomeTest < ActionDispatch::IntegrationTest
  test "loads correctly" do
    # setup

    # exercise
    visit "/"

    # verify
    assert_equal 200, page.status_code
    assert page.has_content?("Items")
    assert page.has_selector?(".item", count: Item.count)


    # teardown
  end
end

# class TestSomeObject
#   def test_something_on_object
#     # setup
#     # exercise
#     # verify
#     # teardown
#   end
# end

# dev and test databases are different >> cf config/database.yml
