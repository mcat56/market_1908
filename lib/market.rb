class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
    @total = Hash.new(0)
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
    @vendors.each do |vendor|
      vendor.inventory.each do |item,count|
        @total[item] += count
      end
    end
    @total
  end


  def sell(item,count)
    total_inventory
    counts = count
    if @total[item] == 0 || @total[item] < count
      return false
    end
    until counts <= 0
      @vendors.each do |vendor|
        if !vendor.inventory.has_key?(item)
          counts -= 0
        elsif vendor.inventory[item] > 0 && count < vendor.inventory[item]
          vendor.inventory[item] -= count
          counts -= count
        elsif vendor.inventory[item] > 0 && count > vendor.inventory[item]
          vendor.inventory[item] = 0
          counts -= count
        end
      end
    end
    true
  end


end
