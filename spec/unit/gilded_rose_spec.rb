require 'simplecov'
require_relative '../spec_helper.rb'
require_relative '../../lib/gilded_rose'






 describe GildedRose do


     describe "#update_quality" do

       it "does not change the name" do
         items = [Item.new("foo", 0, 0)]
         GildedRose.new(items).update_quality()
         expect(items[0].name).to eq "foo"
       end
     end

     describe "#find_name" do
        let(:item) { double 'item', name: "Aged Brie", sell_in: 5, quality: 5 }
       it "finds name" do
         subject = described_class.new([item])
         expect(subject.find_name(item)).to eq(AgedBrie)
       end
     end


 end



 # let(:item) { double 'item', name: "Aged Brie", sell_in: 5, quality: 5 }
 # it'updates item' do
 #   subject = described_class.new([item])
 #   expect(subject.update_quality).to eq 6
 # end
