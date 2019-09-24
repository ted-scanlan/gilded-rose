require_relative '../lib/gilded_rose'

describe GildedRose do

  it'updates aged brie correctly'do
  item1 = Item.new('Aged Brie', 5, 5)
  item2 = Item.new('Conjured', 5, 5)


  gr = GildedRose.new([item1, item2])
  gr.update_quality
  expect(gr.items[0].quality).to be 6
  expect(gr.items[1].quality).to be 3

  end


end
