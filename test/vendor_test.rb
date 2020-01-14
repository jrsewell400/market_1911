require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'
require './lib/item'

class VendorTest < Minitest::Test

  def setup
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  def test_it_exists
    assert_instance_of Item, @item1
    assert_instance_of Item, @item2
  end

  def test_it_has_attributes
    assert_equal "Rocky Mountain Fresh", @vendor.name
    assert_equal Hash.new(0), @vendor.inventory
  end

  def test_stock_starts_as_zero
    assert_equal 0, @vendor.check_stock(@item1)
  end

  def test_it_can_stock_items
    # vendor.stock(item1, 30)
    #
    # vendor.inventory
    # #=> {#<Item:0x007f9c56740d48...> => 30}
    #
    # vendor.check_stock(item1)
    # #=> 30
    #
    # vendor.stock(item1, 25)
    #
    # vendor.check_stock(item1)
    # #=> 55
  end

end

# vendor.stock(item2, 12)
#
# vendor.inventory
# #=> {#<Item:0x007f9c56740d48...> => 55, #<Item:0x007f9c565c0ce8...> => 12}
