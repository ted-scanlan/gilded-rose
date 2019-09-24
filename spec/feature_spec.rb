require_relative '../lib/gilded_rose'

describe GildedRose do

  it'updates aged brie correctly'do
  item = Item.new('Aged Brie', 2, 0)
  gr = GildedRose.new([item])
  gr.update_quality
  

  end


end
