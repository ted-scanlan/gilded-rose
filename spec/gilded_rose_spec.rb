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
