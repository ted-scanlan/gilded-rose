require_relative './Item'
require_relative './Aged_brie'
require_relative './Backstage_passes'
require_relative './Conjured'
require_relative './Sulfuras'
require_relative './Normal_item'

class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items.map! {|item|
      if item.name == "Aged Brie"
        AgedBrie.new(item.name, item.sell_in, item.quality)
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        BackstagePasses.new(item.name, item.sell_in, item.quality)
      elsif item.name == "Conjured"
        Conjured.new(item.name, item.sell_in, item.quality)
      elsif item.name == "Sulfuras"
        Sulfuras.new(item.name, item.sell_in, item.quality)
      else
        NormalItem.new(item.name, item.sell_in, item.quality)
      end
    }
  end

  def update_quality
     @items.map {|item|
       item.update}

  end

end
