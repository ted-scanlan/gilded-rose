require 'simplecov'
require_relative './spec_helper.rb'
require_relative '../lib/gilded_rose'


describe GildedRose do

  describe "#update_quality" do

    #normal items
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it'decreases sellin by 1' do
      items = [Item.new("foo", 5, 5)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 4

    end
    it'decreases quality of normal item by 1' do
      items = [Item.new("foo", 5, 5)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 4
    end

    it'The Quality of an item is never negative' do
      items = [Item.new("foo", 5, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end


    it 'decreases quality twice as fast for a normal item that has passed sellin' do
      items = [Item.new("foo", -1, 8)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 6

    end



    #Backstage passes

    it 'quality increases by 1 when sellin is over 10 days away' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 12, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 11
    end

    it 'quality increases by 2 when sellin is 10 days or less' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 8, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 12
    end

    it 'quality increases by 3 when sellin is 5 days or less' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 13
    end

    it 'quality drops to 0 after the concert' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

    #sulfuras

  it 'never decreases in Quality, and quality is always 80' do
    items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 80)]
    GildedRose.new(items).update_quality()
    expect(items[0].quality).to eq 80
  end

  it 'never has to be sold' do
    items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 80)]
    GildedRose.new(items).update_quality()
    expect(items[0].sell_in).to eq 0
  end




  end

end
