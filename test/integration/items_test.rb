require 'test_helper'

class ItemsTest < ActionDispatch::IntegrationTest

  # USEFUL IF WE HAVE AJAX IN THE PAGE WITH THE TESTS. TO KEEP IN MIND
  # after :each do
  #   TransactionalCapybara::AjaxHelpers.wait_for_ajax(page)
  # end

  def setup
    TransactionalCapybara.share_connection
    @item = FactoryGirl.create(:item)
    @user = @item.user
  end

  test "lets a signed in user create a new item" do
    login_as @user
    visit "/items/new"

    save_and_open_page

    fill_in "item_name", with: "Chaise"
    fill_in "item_value", with: "30"
    attach_file('item_photo', File.absolute_path('./app/assets/images/fairshares.png'))
    click_button 'Create Item'

    save_and_open_page

    assert_equal new_item_share_path(Item.last), page.current_path
    assert_equal 200, page.status_code
    assert page.has_content?("Add a friend sharing ownership of this item with you")
  end

  test "shows a user list of items" do
    login_as @user
    save_and_open_page
    assert page.has_content?("My Shares")
    assert page.has_selector?(".navbar-wagon-item")
  end

  test "shows a specific item details" do
    login_as @user
    visit "/items"
    save_and_open_page
    assert page.has_selector?(".navbar-wagon")
  end


end
