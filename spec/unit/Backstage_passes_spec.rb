require 'simplecov'
require_relative '../spec_helper.rb'
require_relative '../../lib/Backstage_passes'

describe BackstagePasses do

  describe '#update' do
    it'decreases sellin by 1' do
      subject = described_class.new('Backstage passes to a TAFKAL80ETC concert', 5, 5)
      subject.update()
      expect(subject.sell_in).to eq 4

    end
    it 'quality increases by 1 when sellin is over 10 days away' do
      subject = described_class.new("Backstage passes to a TAFKAL80ETC concert", 12, 10)
      subject.update()
      expect(subject.quality).to eq 11
    end

    it 'quality increases by 2 when sellin is 10 days or less' do
      subject = described_class.new("Backstage passes to a TAFKAL80ETC concert", 8, 10)
      subject.update()
      expect(subject.quality).to eq 12
    end

    it 'quality increases by 3 when sellin is 5 days or less' do
      subject = described_class.new("Backstage passes to a TAFKAL80ETC concert", 4, 10)
      subject.update()
      expect(subject.quality).to eq 13
    end

    it 'quality drops to 0 after the concert' do
      subject = described_class.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)
      subject.update()
      expect(subject.quality).to eq 0
    end

  end
end
