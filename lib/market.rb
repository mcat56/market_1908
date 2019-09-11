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


end
