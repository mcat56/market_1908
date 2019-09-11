class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    vendors_that_sell = []
    @vendors.each do |vendor|
      if vendor.inventory[item] > 0
        vendors_that_sell << vendor
      end
    end
    vendors_that_sell
  end

  def sorted_item_list
    items = []
    @vendors.each do |vendor|
      items << vendor.inventory.keys
    end
    items.flatten.uniq.sort
  end

  def total_inventory
    total_inventory = Hash.new(0)
    @vendors.each do |vendor|
      vendor.inventory.each do |item,count|
        total_inventory[item] += count
      end
    end
    total_inventory
  end


end
