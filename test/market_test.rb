require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'
require './lib/item'
require './lib/market'

class ItemTest < Minitest::Test

  def setup
    @market = Market.new("South Pearl Street Farmers Market")
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor3 = Vendor.new("Palisade Peach Shack")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @item5 = Item.new({name: 'Onion', price: '$0.25'})
  end

  def test_it_exists
    assert_instance_of Market, @market
    assert_instance_of Vendor, @vendor1
    assert_instance_of Vendor, @vendor2
    assert_instance_of Item, @item1
    assert_instance_of Item, @item2
    assert_instance_of Item, @item3
    assert_instance_of Item, @item4
    assert_instance_of Item, @item5
  end

  def test_it_has_attributes
    assert_equal "South Pearl Street Farmers Market", @market.name
    assert_equal [], @market.vendors
  end

  def test_vendors_can_be_added
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)
    assert_equal [@vendor1, @vendor2, @vendor3], @market.vendors
  end

  def test_it_can_return_vendor_names
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)
    assert_equal ["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"], @market.vendor_names
  end

  def test_it_can_find_specific_items_sold_by_vendors
    @vendor1.stock(@item1, 35)
    @vendor1.stock(@item2, 7)
    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)
    @vendor3.stock(@item1, 65)
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)

    assert_equal [@vendor1, @vendor3], @market.vendors_that_sell(@item1)

    assert_equal [@vendor2], @market.vendors_that_sell(@item4)
  end

  def test_it_can_sort_item_names
    @vendor1.stock(@item1, 35)
    @vendor1.stock(@item2, 7)
    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)
    @vendor3.stock(@item1, 65)
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)

    assert_equal ["Banana Nice Cream", "Peach", "Peach-Raspberry Nice Cream", "Tomato"], @market.sorted_item_list
  end

  def test_it_can_return_total_inventory_of_items
    @vendor1.stock(@item1, 35)
    @vendor1.stock(@item2, 7)
    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)
    @vendor3.stock(@item1, 65)
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)
    expected = { @item1 => 100, @item2 => 7, @item4 => 50, @item3 => 25 }

    assert_equal expected, @market.total_inventory
  end

  def test_sell_method_returns_false_if_not_enough_of_item_is_in_stock
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    market = Market.new("South Pearl Street Farmers Market")
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    vendor2 = Vendor.new("Ba-Nom-a-Nom")
    market.add_vendor(vendor1)
    market.add_vendor(vendor2)
    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)
    vendor2.stock(item4, 50)

    assert_equal false, market.sell(item1, 40)
  end


    # item1 = Item.new({name: 'Peach', price: "$0.75"})
    # item2 = Item.new({name: 'Tomato', price: '$0.50'})
    # item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    # item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    # item5 = Item.new({name: 'Onion', price: '$0.25'})
    # market = Market.new("South Pearl Street Farmers Market")
    # vendor1 = Vendor.new("Rocky Mountain Fresh")
    # vendor1.stock(item1, 35)
    # vendor1.stock(item2, 7)
    # vendor2 = Vendor.new("Ba-Nom-a-Nom")
    # vendor2.stock(item4, 50)
    # vendor2.stock("Peach-Raspberry Nice Cream", 25)
    # vendor3 = Vendor.new("Palisade Peach Shack")
    # vendor3.stock(item1, 65)
    # market.add_vendor(vendor1)
    # market.add_vendor(vendor2)
    # market.add_vendor(vendor3)
    # market.sell(item1, 200)

end
# @item1 = Item.new({name: 'Peach', price: "$0.75"})
#=> #<Item:0x007f9c56740d48...>

# item2 = Item.new({name: 'Tomato', price: '$0.50'})
#=> #<Item:0x007f9c565c0ce8...>

# item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
#=> #<Item:0x007f9c562a5f18...>

# item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
#=> #<Item:0x007f9c56343038...>

# item5 = Item.new({name: 'Onion', price: '$0.25'})
#=> #<Item:0x007f9c561636c8...>

# market = Market.new("South Pearl Street Farmers Market")
#=> #<Market:0x00007fe134933e20...>

# vendor1 = Vendor.new("Rocky Mountain Fresh")
#=> #<Vendor:0x00007fe1348a1160...>

# vendor1.stock(item1, 35)

# vendor1.stock(item2, 7)

# vendor2 = Vendor.new("Ba-Nom-a-Nom")
#=> #<Vendor:0x00007fe1349bed40...>

# vendor2.stock(item4, 50)

# vendor2.stock("Peach-Raspberry Nice Cream", 25)

# vendor3 = Vendor.new("Palisade Peach Shack")
#=> #<Vendor:0x00007fe134910650...>

# vendor3.stock(item1, 65)

# market.add_vendor(vendor1)

# market.add_vendor(vendor2)

# market.add_vendor(vendor3)

# market.sell(item1, 200)
#=> false

# market.sell(item5, 1)
#=> false

# market.sell(item4, 5)
#=> true

# vendor2.check_stock(item4)
#=> 45

# market.sell(item1, 40)
#=> true

# vendor1.check_stock(item1)
#=> 0

# vendor3.check_stock(item1)
#=> 60
