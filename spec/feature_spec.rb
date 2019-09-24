require_relative '../lib/gilded_rose'

describe GildedRose do

  it'updates items correctly'do

  # items = [
  #   Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
  #   Item.new(name="Aged Brie", sell_in=2, quality=0),
  #   Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
  #   Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
  #   Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80),
  #   Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
  #   Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
  #   Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49),
  #   # This Conjured item does not work properly yet
  #   Item.new(name="Conjured", sell_in=3, quality=6), # <-- :O
  # ]



  item1 = Item.new('Aged Brie', 5, 5)
  # item2 = Item.new('Conjured', 5, 5)


  gr = GildedRose.new([item1])
  gr.update_quality
  expect(gr.items[0].quality).to be 6


  end


end
