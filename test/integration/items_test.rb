require 'test_helper'

class ItemsTest < ActionDispatch::IntegrationTest

  def setup
    @item = FactoryGirl.create(:item)
    @user = @item.user
  end

  test "lets a signed in user create a new item" do
    login_as @user
    visit "/items/new"

    save_and_open_page

    fill_in "item_name", with: "Chaise"
    fill_in "item_value", with: "30"
    click_button 'Create Item'
    save_and_open_page

    assert_equal new_item_share_path(Item.last), page.current_path
    assert_equal 200, page.status_code
    assert page.has_content?("Add a friend sharing ownership of this item with you")
  end

  test "shows a user list of items" do
    login_as @user
    puts "@item:"
    p @item
    puts "@user:"
    p @user
    puts "@user.items"
    p @user.items
    visit "/items"
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






# test/factories/items.rb

FactoryGirl.define do
  factory :item do
    name 'Table'
    value 200.0
    remote_photo_url 'http://www.hbc333.com/data/out/193/47081647-random-picture.png'
    description 'A beautiful table'
    association :user
  end
end


# test/factories/users.rb

FactoryGirl.define do
  factory :user do
    first_name "romu"
    last_name "dummy"
    email "romu@gmail.com"
    password "testtest"
    password_confirmation "testtest"
    remote_photo_url "http://www.hbc333.com/data/out/193/47081647-random-picture.png"
  end
end


# test/integration/items_test.rb

require 'test_helper'

class ItemsTest < ActionDispatch::IntegrationTest

  def setup
    @item = FactoryGirl.create(:item)
    @user = @item.user
  end

  test "shows a user list of items" do
    login_as @user
    puts "@item:"
    p @item
    puts "@user:"
    p @user
    puts "@user.items"
    p @user.items
    visit "/items"
    save_and_open_page
    assert page.has_content?("My Shares")
    assert page.has_selector?(".navbar")
  end
end


# terminal results when running the test

ItemsTest
@item:
#<Item id: 1, name: "Table", description: "A beautiful table", value: 200, created_at: "2017-03-30 06:05:40", updated_at: "2017-03-30 06:05:40", photo: "image/upload/v1490853941/n1gijgwwxew0ypyrt1ax.png", user_id: 1, place_id: nil, category: nil>
@user:
#<User id: 1, email: "romu@gmail.com", created_at: "2017-03-30 06:05:36", updated_at: "2017-03-30 06:05:36", first_name: "romu", last_name: "escande", photo: "image/upload/v1490853940/eulubkocpsik1dxdpskq.png", admin: false, provider: nil, uid: nil, facebook_picture_url: nil, token: nil, token_expiry: nil>
@user.items
#<ActiveRecord::Associations::CollectionProxy [#<Item id: 1, name: "Table", description: "A beautiful table", value: 200, created_at: "2017-03-30 06:05:40", updated_at: "2017-03-30 06:05:40", photo: "image/upload/v1490853941/n1gijgwwxew0ypyrt1ax.png", user_id: 1, place_id: nil, category: nil>]>
  test_shows_a_user_list_of_items                                 FAIL (14.10s)
Minitest::Assertion:         Expected false to be truthy.
        test/integration/items_test.rb:36:in block in <class:ItemsTest>


# error message on the page opened by save_and_open_page

ActiveRecord::RecordNotFound at /items
Couldn't find User with 'id'=1


