class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|

        return if item.name == "Sulfuras, Hand of Ragnaros"
        return if item.quality == 0
        item.sell_in -= 1

        if item.name == "Conjured"
          item.sell_in < 0 ? item.quality -= 4 : item.quality -= 2
          return
        end

        if item.name == "Aged Brie"
          return if item.quality >= 50
          item.sell_in < 0 ? item.quality += 2 : item.quality += 1
          return
        end

        if item.name == "Backstage passes to a TAFKAL80ETC concert"
          case item.sell_in
          when -1..0
            item.quality = 0
          when 1..5
            item.quality += 3
          when 6..10
            item.quality += 2
          else
            item.quality += 1
          end
          return
        end

          item.sell_in <= 0 ? item.quality -= 2 : item.quality -= 1

  end
end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
