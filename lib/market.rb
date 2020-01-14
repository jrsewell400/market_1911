class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor_name)
    @vendors << vendor_name
  end

  def vendor_names
    @vendors.map { |vendor| vendor.name }
  end

  def vendors_that_sell(item_obj)
    vendors_that_sell = []
    @vendors.each do |vendor|
      vendor.inventory.each do |inventory|
        if inventory[0] == item_obj
          vendors_that_sell << vendor
        end
      end
    end
    vendors_that_sell
  end

  def sorted_item_list
    all_items = @vendors.map { |vendor| vendor.inventory.keys }.flatten
    all_items.map { |item| item.name }.uniq.sort
  end

  def total_inventory
    all_items = @vendors.map { |vendor| vendor.inventory}
    total_inventory = all_items.each_with_object(Hash.new(0)) do |hash, acc|
      hash.each { |key, value| acc[key] += value }
    end
    total_inventory
  end

  def sell(item_obj, quantity)
    in_stock = nil
    all_items = @vendors.map { |vendor| vendor.inventory}
    total_inventory = all_items.each_with_object(Hash.new(0)) do |hash, acc|
      hash.each { |key, value| acc[key] += value }
    end
    total_inventory.each do |item|
      if item[0] == item_obj && item[1] < quantity
        in_stock = false
      end
    end
    in_stock
  end

end
