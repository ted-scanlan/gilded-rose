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
       find_name(item).new(item.name, item.sell_in, item.quality)
    }
  end

  def find_name(item)

    if item.name == "Aged Brie"
      AgedBrie
    elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
      BackstagePasses
    elsif item.name == "Conjured"
      Conjured
    elsif item.name == "Sulfuras"
      Sulfuras
    else
      NormalItem
    end
  end


  def update_quality
     @items.map {|item|
       item.update}

  end

end
