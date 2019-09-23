require_relative './Item'
require_relative './Aged_brie'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|

        return if item.name == "Sulfuras, Hand of Ragnaros"
        return if item.quality == 0

        item.sell_in -= 1

        item.sell_in <= 0 ? item.quality -= 2 : item.quality -= 1

  end
end
end
