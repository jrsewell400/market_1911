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
    @vendor.stock(@item1, 30)
    expected = { @item1 => 30 }
    assert_equal expected, @vendor.inventory
  end

  def test_it_can_check_stock_after_stocking
    @vendor.stock(@item1, 30)
    assert_equal 30, @vendor.check_stock(@item1)
  end

  def test_it_can_stock_multiple_items_and_return_total_stock
    @vendor.stock(@item1, 30)
    @vendor.stock(@item1, 25)
    assert_equal 55, @vendor.check_stock(@item1)
  end

  def test_it_can_stock_multiple_items_and_return_hash_of_items_and_stock
    @vendor.stock(@item1, 30)
    @vendor.stock(@item1, 25)
    @vendor.stock(@item2, 12)
    expected = { @item1 => 55, @item2 => 12 }
    assert_equal expected, @vendor.inventory
  end

end
