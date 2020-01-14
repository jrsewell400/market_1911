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

  end
end
