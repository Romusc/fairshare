require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def setup
    @item = FactoryGirl.build(:item)
  end

  test "invalid without a name" do
    @item.name = nil
    assert_presence(@item, :name)
  end

  test "invalid without a value" do
    @item.value = nil
    assert_presence(@item, :value)
  end
end
