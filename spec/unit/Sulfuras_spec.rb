require 'simplecov'
require_relative '../spec_helper.rb'
require_relative '../../lib/Sulfuras'


describe Sulfuras do

  describe "#update" do

    it 'never decreases in Quality, and quality is always 80' do
      subject = described_class.new('Sulfuras, Hand of Ragnaros', 0, 80)
      subject.update()
      expect(subject.quality).to eq 80

    end

    it 'never has to be sold' do
      subject = described_class.new('Sulfuras, Hand of Ragnaros', 0, 80)
      subject.update()
      expect(subject.sell_in).to eq 0
    end

  end
end
