require 'simplecov'
require_relative './spec_helper.rb'
require_relative '../lib/Normal_item.rb'

describe NormalItem do

  describe "#update" do
    it "does not change the name" do
      subject = described_class.new("foo", 0, 0)
      subject.update()
      expect(subject.name).to eq "foo"
    end

    it'decreases sellin by 1' do
      subject = described_class.new("foo", 5, 5)
      subject.update()
      expect(subject.sell_in).to eq 4

    end
    it'decreases quality of normal item by 1' do
      subject = described_class.new("foo", 5, 5)
      subject.update()
      expect(subject.quality).to eq 4
    end

    it'The Quality of an item is never negative' do
      subject = described_class.new("foo", 5, 0)
      subject.update()
      expect(subject.quality).to eq 0
    end


    it 'decreases quality twice as fast for a normal item that has passed sellin' do
      subject = described_class.new("foo", -1, 8)
      subject.update()
      expect(subject.quality).to eq 6

    end

  end
end
