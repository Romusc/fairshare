require 'test_helper'

class HomeTest < ActionDispatch::IntegrationTest
  test "loads correctly" do
    # setup

    # exercise
    visit "/"

    # puts page.body
    save_and_open_page
    # verify
    assert_equal 200, page.status_code
    assert page.has_selector?(".card", count: Item.count)


    # teardown
  end
end
