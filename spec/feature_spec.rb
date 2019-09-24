require_relative '../lib/gilded_rose'

describe GildedRose do

  it'updates items correctly'do

  items = [
    Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
    Item.new(name="Aged Brie", sell_in=2, quality=0),
    Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
    Item.new(name="Sulfuras", sell_in=0, quality=80),
    Item.new(name="Sulfuras", sell_in=-1, quality=80),
    Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
    Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
    Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49),

    Item.new(name="Conjured", sell_in=3, quality=6), # <-- :O
  ]






  gr = GildedRose.new(items)
  gr.update_quality
  expect(gr.items[0].quality).to be 19
  expect(gr.items[1].quality).to be 1
  expect(gr.items[2].quality).to be 6
  expect(gr.items[3].quality).to be 80
  expect(gr.items[4].quality).to be 80
  expect(gr.items[5].quality).to be 21
  expect(gr.items[6].quality).to be 50
  expect(gr.items[7].quality).to be 50
  expect(gr.items[8].quality).to be 4


  end


end
