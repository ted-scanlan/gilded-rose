require_relative './Item'
require_relative './Aged_brie'

class GildedRose

  def initialize(items)
    @items = items.map {|item|
      if item.name == "Aged Brie"
      AgedBrie.new(item.name, item.sell_in, item.quality)
      end
    }
  end

  def update_quality
     @items.each {|item| item.update}

  end

end
